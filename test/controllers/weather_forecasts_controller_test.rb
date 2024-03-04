# frozen_string_literal: true

require 'test_helper'

class WeatherForecastControllerTest < ActionDispatch::IntegrationTest

  test "should show weather details page" do
    address = 'Charlotte'
    get root_url, params: { address: }
    assert_response :success
    assert_equal address, session[:address]
  end

  test "should not show weather details when invalid input" do
    address = ''
    get root_url, params: { address: }
    assert_nil session[:address]
  end
end
