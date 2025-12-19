# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about RewardPay.
    class RewardPay < Internal::Types::Model
      field :fees, -> { Payroc::Types::RewardPayFees }, optional: false, nullable: false
    end
  end
end
