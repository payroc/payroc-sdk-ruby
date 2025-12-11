# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the information for the custom label.
    class CustomLabel < Internal::Types::Model
      field :element, -> { Payroc::Types::CustomLabelElement }, optional: true, nullable: false
      field :label, -> { String }, optional: true, nullable: false
    end
  end
end
