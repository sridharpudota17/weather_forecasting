# frozen_string_literal: true

module WeatherForecastsHelper

  # display mininum temperature of user input
  def min_temp(weather)
    "#{I18n.t('show.min_temp')} #{weather.temperature_min} ℃"
  end

  # display maximum temperature of user input
  def max_temp(weather)
    "#{I18n.t('show.max_temp')} #{weather.temperature_max} ℃"
  end

  # display humidity temperature of user input
  def humidity(weather)
    "#{I18n.t('show.humidity')} #{weather.humidity} %"
  end

  # display test weather data fetched from cache or using API call
  def cache_status_text(weather_cache_exist)
    return I18n.t('show.results_from_cache') if weather_cache_exist

    I18n.t('show.results_using_api_call')
  end
end
