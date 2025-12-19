# frozen_string_literal: true

module Payroc
  module Types
    class FourHundredErrorsItem < Internal::Types::Model
      field :parameter, -> { String }, optional: true, nullable: false
      field :detail, -> { String }, optional: true, nullable: false
      field :message, -> { String }, optional: true, nullable: false
    end
  end
end
