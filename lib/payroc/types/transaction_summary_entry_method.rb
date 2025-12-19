# frozen_string_literal: true

module Payroc
  module Types
    module TransactionSummaryEntryMethod
      extend Payroc::Internal::Types::Enum

      BARCODE_READ = "barcodeRead"
      SMART_CHIP_READ = "smartChipRead"
      SWIPED_ORIGIN_UNKNOWN = "swipedOriginUnknown"
      CONTACTLESS_CHIP = "contactlessChip"
      ECOMMERCE = "ecommerce"
      MANUALLY_ENTERED = "manuallyEntered"
      MANUALLY_ENTERED_FALLBACK = "manuallyEnteredFallback"
      SWIPED = "swiped"
      SWIPED_FALLBACK = "swipedFallback"
      SWIPED_ERROR = "swipedError"
      SCANNED_CHECK_READER = "scannedCheckReader"
      CREDENTIAL_ON_FILE = "credentialOnFile"
      UNKNOWN = "unknown"
    end
  end
end
