# frozen_string_literal: true

module Payroc
  module Types
    class ProcessingAccountOwnersItem < Internal::Types::Model
      field :owner_id, -> { Integer }, optional: true, nullable: false, api_name: "ownerId"
      field :first_name, -> { String }, optional: true, nullable: false, api_name: "firstName"
      field :last_name, -> { String }, optional: true, nullable: false, api_name: "lastName"
      field :link, -> { Payroc::Types::ProcessingAccountOwnersItemLink }, optional: true, nullable: false
    end
  end
end
