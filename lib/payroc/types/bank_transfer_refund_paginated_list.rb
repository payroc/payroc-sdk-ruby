# frozen_string_literal: true

module Payroc
  module Types
    class BankTransferRefundPaginatedList < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Payroc::Types::BankTransferRefund] }, optional: true, nullable: false
    end
  end
end
