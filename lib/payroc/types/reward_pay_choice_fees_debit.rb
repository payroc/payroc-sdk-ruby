# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about fees for debit transactions.
    class RewardPayChoiceFeesDebit < Internal::Types::Model
      field :option, -> { Payroc::Types::RewardPayChoiceFeesDebitOption }, optional: true, nullable: false
      field :volume, -> { Integer }, optional: false, nullable: false
      field :transaction, -> { Integer }, optional: false, nullable: false
    end
  end
end
