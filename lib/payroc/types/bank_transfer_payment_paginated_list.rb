# frozen_string_literal: true

module Payroc
  module Types
    class BankTransferPaymentPaginatedList < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Payroc::Types::BankTransferPayment] }, optional: true, nullable: false
    end
  end
end
