# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the interchange fees for the transaction.
    class TransactionInterchange < Internal::Types::Model
      field :basis_point, -> { Integer }, optional: true, nullable: false, api_name: "basisPoint"
      field :transaction_fee, -> { Integer }, optional: true, nullable: false, api_name: "transactionFee"
    end
  end
end
