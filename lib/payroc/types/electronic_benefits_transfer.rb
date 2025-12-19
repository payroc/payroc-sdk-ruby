# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the fees for EBT transactions.
    class ElectronicBenefitsTransfer < Internal::Types::Model
      field :transaction, -> { Integer }, optional: false, nullable: false
    end
  end
end
