# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the fees.
    class RewardPayChoiceFees < Internal::Types::Model
      field :monthly_subscription, -> { Integer }, optional: false, nullable: false, api_name: "monthlySubscription"
      field :debit, -> { Payroc::Types::RewardPayChoiceFeesDebit }, optional: false, nullable: false
      field :credit, -> { Payroc::Types::RewardPayChoiceFeesCredit }, optional: false, nullable: false
      field :speciality_cards, -> { Payroc::Types::SpecialityCards }, optional: true, nullable: false, api_name: "specialityCards"
    end
  end
end
