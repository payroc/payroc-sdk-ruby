# frozen_string_literal: true

module Payroc
  module Types
    class ContactMethodPhone < Internal::Types::Model
      field :value, -> { String }, optional: false, nullable: false
    end
  end
end
