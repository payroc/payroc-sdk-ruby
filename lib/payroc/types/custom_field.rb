# frozen_string_literal: true

module Payroc
  module Types
    class CustomField < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :value, -> { String }, optional: false, nullable: false
    end
  end
end
