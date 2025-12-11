# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the business.
    class Business < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :tax_id, -> { String }, optional: false, nullable: false, api_name: "taxId"
      field :organization_type, -> { Payroc::Types::BusinessOrganizationType }, optional: false, nullable: false, api_name: "organizationType"
      field :country_of_operation, -> { Payroc::Types::BusinessCountryOfOperation }, optional: true, nullable: false, api_name: "countryOfOperation"
      field :addresses, -> { Internal::Types::Array[Payroc::Types::LegalAddress] }, optional: false, nullable: false
      field :contact_methods, -> { Internal::Types::Array[Payroc::Types::ContactMethod] }, optional: false, nullable: false, api_name: "contactMethods"
    end
  end
end
