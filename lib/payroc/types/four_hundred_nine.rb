# frozen_string_literal: true

module Payroc
  module Types
    class FourHundredNine < Internal::Types::Model
      field :type, -> { String }, optional: false, nullable: false
      field :title, -> { String }, optional: false, nullable: false
      field :status, -> { Integer }, optional: false, nullable: false
      field :detail, -> { String }, optional: false, nullable: false
      field :instance, -> { String }, optional: true, nullable: false
      field :errors, -> { Internal::Types::Array[Payroc::Types::FourHundredNineErrorsItem] }, optional: true, nullable: false
      field :link, -> { Payroc::Types::Link }, optional: true, nullable: false
    end
  end
end
