# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about ConsumerChoice.
    class ConsumerChoice < Internal::Types::Model
      field :fees, -> { Payroc::Types::ConsumerChoiceFees }, optional: false, nullable: false
    end
  end
end
