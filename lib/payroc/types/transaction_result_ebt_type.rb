# frozen_string_literal: true

module Payroc
  module Types
    module TransactionResultEbtType
      extend Payroc::Internal::Types::Enum

      CASH_PURCHASE = "cashPurchase"
      CASH_PURCHASE_WITH_CASHBACK = "cashPurchaseWithCashback"
      FOOD_STAMP_PURCHASE = "foodStampPurchase"
      FOOD_STAMP_VOUCHER_PURCHASE = "foodStampVoucherPurchase"
      FOOD_STAMP_RETURN = "foodStampReturn"
      FOOD_STAMP_VOUCHER_RETURN = "foodStampVoucherReturn"
      CASH_BALANCE_INQUIRY = "cashBalanceInquiry"
      FOOD_STAMP_BALANCE_INQUIRY = "foodStampBalanceInquiry"
      CASH_WITHDRAWAL = "cashWithdrawal"
    end
  end
end
