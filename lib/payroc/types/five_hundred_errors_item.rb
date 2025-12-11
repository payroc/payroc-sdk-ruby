# frozen_string_literal: true

module Payroc
  module Types
    class FiveHundredErrorsItem < Internal::Types::Model
      field :message, -> { String }, optional: true, nullable: false
    end
  end
end
