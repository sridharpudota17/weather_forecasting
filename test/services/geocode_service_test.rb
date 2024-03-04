# frozen_string_literal: true

require 'test_helper'

class GeocodeServiceTest < ActiveSupport::TestCase

  test "should retun address details of valid user input" do
    address = 'Charlotte'
    geocode = GeocodeService.call(address)
    assert_in_delta 35.2271, geocode.latitude, 0.1
    assert_in_delta -80.8431, geocode.longitude, 0.1
    assert_equal 'us', geocode.country_code
    assert_equal '380001', geocode.postal_code
  end
end
