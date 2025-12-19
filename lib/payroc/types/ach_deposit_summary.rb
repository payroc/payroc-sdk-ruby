# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the ACH deposit.
    class AchDepositSummary < Internal::Types::Model
      field :ach_deposit_id, -> { Integer }, optional: true, nullable: false, api_name: "achDepositId"
      field :link, -> { Payroc::Types::Link }, optional: true, nullable: false
    end
  end
end
