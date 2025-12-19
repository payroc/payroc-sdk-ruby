# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the convenience fee for the transaction.
    class ConvenienceFee < Internal::Types::Model
      field :amount, -> { Integer }, optional: false, nullable: false
    end
  end
end
