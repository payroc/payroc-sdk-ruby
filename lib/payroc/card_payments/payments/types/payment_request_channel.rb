# frozen_string_literal: true

module Payroc
  module CardPayments
    module Payments
      module Types
        module PaymentRequestChannel
          extend Payroc::Internal::Types::Enum

          POS = "pos"
          WEB = "web"
          MOTO = "moto"
        end
      end
    end
  end
end
