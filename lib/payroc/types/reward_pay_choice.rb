# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about RewardPayChoice.
    class RewardPayChoice < Internal::Types::Model
      field :fees, -> { Payroc::Types::RewardPayChoiceFees }, optional: false, nullable: false
    end
  end
end
