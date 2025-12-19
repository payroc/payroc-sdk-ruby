# frozen_string_literal: true

module Payroc
  module Types
    class FourHundredOne < Internal::Types::Model
      field :type, -> { String }, optional: false, nullable: false
      field :title, -> { String }, optional: false, nullable: false
      field :status, -> { Integer }, optional: false, nullable: false
      field :detail, -> { String }, optional: false, nullable: false
    end
  end
end
