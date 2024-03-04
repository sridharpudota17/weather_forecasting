# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  scope '(:locale)', locale: /en|es/ do
    root 'weather_forecasts#show'
  end
end
