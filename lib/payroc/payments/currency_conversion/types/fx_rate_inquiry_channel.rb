# frozen_string_literal: true

module Payroc
  module Payments
    module CurrencyConversion
      module Types
        module FxRateInquiryChannel
          extend Payroc::Internal::Types::Enum

          POS = "pos"
          WEB = "web"
          MOTO = "moto"
        end
      end
    end
  end
end
