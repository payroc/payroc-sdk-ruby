# frozen_string_literal: true

module Payroc
  module Types
    class ProcessingAccountContactsItem < Internal::Types::Model
      field :contact_id, -> { Integer }, optional: true, nullable: false, api_name: "contactId"
      field :first_name, -> { String }, optional: true, nullable: false, api_name: "firstName"
      field :last_name, -> { String }, optional: true, nullable: false, api_name: "lastName"
      field :link, -> { Payroc::Types::ProcessingAccountContactsItemLink }, optional: true, nullable: false
    end
  end
end
