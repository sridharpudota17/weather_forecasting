# frozen_string_literal: true

require 'faraday'
require 'ostruct'

# Serivce for calling OpenWeather api and fetching details of weather.
class WeatherForecastService
  def self.call(latitude, longitude)
    # Setting Farady for API call
    conn = Faraday.new do |f|
      f.request :json
      f.request :retry
      f.response :json
    end

    # Getting response from APi call to OpenWeather
    response = conn.get(OPEN_WEATHER_ENDPOINT, {
                          appid: Rails.application.credentials.open_weather_api_key,
                          lat: latitude,
                          lon: longitude,
                          units: 'metric'
                        })

    # Raise error when request failed
    raise IOError, "Failed to get weather data: #{response.status}" unless response.success?

    body = response.body
    # Raise error when response body is empty.
    raise IOError, I18n.t('services.web_forecast.empty_body') if body.nil? || body.empty?

    weather_data = body.fetch('main', {}) # Finding weather data from body
    weather_description = (body['weather']&.first || {})['description'] # Finding weather description from body

    # Raise error when unable to find weather data and description
    raise IOError, I18n.t('services.web_forecast.weather_data_missing') unless weather_data && weather_description

    # Creating OpenStruct object to return retrieved data
    OpenStruct.new(
      temperature: weather_data['temp'],
      temperature_min: weather_data['temp_min'],
      temperature_max: weather_data['temp_max'],
      humidity: weather_data['humidity'],
      description: weather_description
    )
  rescue Faraday::Error => e
    raise IOError, "Connection error: #{e.message}" # Raises IOError if Faraday raise exception
  end
end
