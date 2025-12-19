# frozen_string_literal: true

module Payroc
  module Types
    class ContactMethodFax < Internal::Types::Model
      field :value, -> { String }, optional: false, nullable: false
    end
  end
end
