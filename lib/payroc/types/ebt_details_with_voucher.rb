# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the Electronic Benefit Transfer (EBT) transaction.
    class EbtDetailsWithVoucher < Internal::Types::Model
      field :voucher, -> { Payroc::Types::Voucher }, optional: true, nullable: false
    end
  end
end
