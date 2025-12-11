# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the address.
    class Address < Internal::Types::Model
      field :address_1, -> { String }, optional: false, nullable: false, api_name: "address1"
      field :address_2, -> { String }, optional: true, nullable: false, api_name: "address2"
      field :address_3, -> { String }, optional: true, nullable: false, api_name: "address3"
      field :city, -> { String }, optional: false, nullable: false
      field :state, -> { String }, optional: false, nullable: false
      field :country, -> { String }, optional: false, nullable: false
      field :postal_code, -> { String }, optional: false, nullable: false, api_name: "postalCode"
    end
  end
end
