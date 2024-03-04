# Weather Forecaster Application with Ruby on Rails
## Overview
This Ruby on Rails application serves as a weather forecaster, allowing users to input an address and retrieve forecast data. The application utilizes various technologies and techniques, including integration with external APIs, Test-Driven Development (TDD), and implementation of caching mechanisms.

## Scope

1. Use Ruby On Rails.

2. Accept an address as input.

3. Retrieve forecast data for the given address. This should include, at minimum, the current temperature. Bonus points: retrieve high/low and/or extended forecast.

4. Display the requested forecast details to the user.

5. Cache the forecast details for 30 minutes for all subsequent requests by zip codes. Display indicator in result is pulled from cache.

## Setup

### Project Initialization
Begin by creating a new Ruby on Rails app.
Incorporate Bootstrap for streamlined styling.

### Controller Creation
Generate a weather_forecasts controller along with its associated tests.

Write test cases in test/controllers/weather_forecasts_controller_test.rb for comprehensive coverage.

Enhance user experience by implementing flash messages for conveying important notifications and alerts throughout the application. A dedicated view partial (_message.html.erb) handles the display of these messages.

## Forecast Retrieval
Geocoding with Geocoder Gem.

Leverage the Geocoder gem to convert user-provided addresses into latitude and longitude coordinates. Configure Geocoder to utilize the ArcGIS API for geocoding functionality.


### Weather Forecast Service
Develop a WeatherForecastService to interact with the OpenWeatherMap API. Retrieve forecast data using latitude and longitude coordinates obtained through geocoding.

### Setup OpenWeatherMap API key
We have used OpenWeatherMap API for retrieving weather details. To use OpenWeatherMap API we need to have api key and we need to add api key to rails credentials.

Please visit https://openweathermap.org/appid for API key generation details.

After getting api keys we need to add api key to rails credentials using following command.

``EDITOR=nano rails credentials:edit``

Please use ``open_weather_api_key`` while adding api key to credentials.

For example,
    you got API key like 'OPEN_WEATHER_API_KEY', you need to add following in rails credentials:

    open_weather_api_key: OPEN_WEATHER_API_KEY

### Faraday Gem Usage
Employ the Faraday gem for executing HTTP API requests. Its versatility and support for asynchronous programming make it an ideal choice for handling API interactions within the application.

## OpenWeather API Integration
Sign up for an API key on the OpenWeather website to enable access to their weather data. Incorporate the API key into the application for seamless integration.

### Caching Implementation
Enable caching mechanisms within the Rails development environment to facilitate efficient storage and retrieval of forecast details. Ensure that the application indicates when forecast data is retrieved from the cache.

## Conclusion
Through the utilization of industry-standard tools and methodologies, this weather forecaster application demonstrates the power and flexibility of Ruby on Rails. Its implementation showcases the principles of Test-Driven Development, integration with external APIs, and effective caching strategies, providing users with a reliable and efficient weather forecasting solution.
