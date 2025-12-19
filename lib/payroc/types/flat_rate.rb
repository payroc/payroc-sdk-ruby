# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about Flat Rate.
    class FlatRate < Internal::Types::Model
      field :fees, -> { Payroc::Types::FlatRateFees }, optional: false, nullable: false
    end
  end
end
