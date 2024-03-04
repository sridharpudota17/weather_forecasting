# frozen_string_literal: true

# Service to retrieving address details using Geocoder gem.
class GeocodeService
  def self.call(address)
    response = Geocoder.search(address) # Fetching details using Geocode gem

    # Raise error if response is empty from Geocoder
    raise IOError, I18n.t('services.geocode.invalid_address') unless response && response.any?

    data = response.first.data # Retrieving data from response

    # Raise error when data is not present
    raise IOError, I18n.t('services.geocode.data_error') unless data

    address_data = data["address"] # Finding address from data

    # Raises error if unable to find proper details of user input
    raise IOError, I18n.t('services.geocode.lattitude_error') unless data['lat']
    raise IOError, I18n.t('services.geocode.longitude_error') unless data['lon']
    raise IOError, I18n.t('services.geocode.address_missing') unless address_data
    raise IOError, I18n.t('services.geocode.country_code_missing') unless address_data['country_code']
    raise IOError, I18n.t('services.geocode.postalcode_missing') unless address_data['postcode']

    # Creating OpenStruct object to return address details
    OpenStruct.new(
      latitude: data['lat'].to_f,
      longitude: data['lon'].to_f,
      country_code: address_data['country_code'],
      postal_code: address_data['postcode']
    )
  end
end
