# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about transaction amounts for the processing account.
    class ProcessingTransactionAmounts < Internal::Types::Model
      field :average, -> { Integer }, optional: false, nullable: false
      field :highest, -> { Integer }, optional: false, nullable: false
    end
  end
end
