# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the fees for ACH transactions.
    class Ach < Internal::Types::Model
      field :fees, -> { Payroc::Types::AchFees }, optional: true, nullable: false
    end
  end
end
