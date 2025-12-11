# frozen_string_literal: true

module Payroc
  module Types
    class Contact < Internal::Types::Model
      field :contact_id, -> { Integer }, optional: true, nullable: false, api_name: "contactId"
      field :type, -> { Payroc::Types::ContactType }, optional: false, nullable: false
      field :first_name, -> { String }, optional: false, nullable: false, api_name: "firstName"
      field :middle_name, -> { String }, optional: true, nullable: false, api_name: "middleName"
      field :last_name, -> { String }, optional: false, nullable: false, api_name: "lastName"
      field :identifiers, -> { Internal::Types::Array[Payroc::Types::Identifier] }, optional: false, nullable: false
      field :contact_methods, -> { Internal::Types::Array[Payroc::Types::ContactMethod] }, optional: false, nullable: false, api_name: "contactMethods"
    end
  end
end
