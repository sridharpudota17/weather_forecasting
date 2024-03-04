# frozen_string_literal: true

# Weather details controller
class WeatherForecastsController < ApplicationController
  def show
    @address = params[:address]&.strip # Strip address string for validatin
    return if @address.nil? # Not executing weather fetching logic if user not submit the form

    if @address.blank? # Validates address string and show message if address string is not valid
      flash.now[:alert] = t('services.geocode.invalid_address')
    else
      # Retrieving data for proper input by user
      fetch_weather_data
    end
  end

  private

  def fetch_weather_data
    session[:address] = @address # Stroing address in session
    geocode = GeocodeService.call(@address) # Getting details of user input using Geocoder gem (https://github.com/alexreisner/geocoder)
    weather_cache_key = geocode.postal_code # Using postal code getched using Geocoder gem as rails cache key
    @weather_cache_exist = Rails.cache.exist?(weather_cache_key) # Flag that shows result has been fetched from cache or using API call

    # If data available in cache fetching it from cache else calling service for retrieving data and storing it in cache for 30 minutes.
    @weather = Rails.cache.fetch(weather_cache_key, expires_in: 30.minutes) do
      WeatherForecastService.call(geocode.latitude, geocode.longitude) # Retrieving weather data using API call to OpenWeatherMap(https://api.openweathermap.org/data/2.5/weather).
    end
  rescue StandardError => e
    flash.now[:alert] = e.message # Error message if there is any exception
  end
end
