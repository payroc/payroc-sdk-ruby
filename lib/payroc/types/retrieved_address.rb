# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the address.
    class RetrievedAddress < Internal::Types::Model
      field :address_1, -> { String }, optional: true, nullable: false, api_name: "address1"
      field :address_2, -> { String }, optional: true, nullable: false, api_name: "address2"
      field :address_3, -> { String }, optional: true, nullable: false, api_name: "address3"
      field :city, -> { String }, optional: true, nullable: false
      field :state, -> { String }, optional: true, nullable: false
      field :country, -> { String }, optional: true, nullable: false
      field :postal_code, -> { String }, optional: true, nullable: false, api_name: "postalCode"
    end
  end
end
