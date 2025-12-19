# frozen_string_literal: true

module Payroc
  module Types
    class Owner < Internal::Types::Model
      field :owner_id, -> { Integer }, optional: true, nullable: false, api_name: "ownerId"
      field :first_name, -> { String }, optional: false, nullable: false, api_name: "firstName"
      field :middle_name, -> { String }, optional: true, nullable: false, api_name: "middleName"
      field :last_name, -> { String }, optional: false, nullable: false, api_name: "lastName"
      field :date_of_birth, -> { String }, optional: false, nullable: false, api_name: "dateOfBirth"
      field :address, -> { Payroc::Types::Address }, optional: false, nullable: false
      field :identifiers, -> { Internal::Types::Array[Payroc::Types::Identifier] }, optional: false, nullable: false
      field :contact_methods, -> { Internal::Types::Array[Payroc::Types::ContactMethod] }, optional: false, nullable: false, api_name: "contactMethods"
      field :relationship, -> { Payroc::Types::OwnerRelationship }, optional: false, nullable: false
    end
  end
end
