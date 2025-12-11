# frozen_string_literal: true

module Payroc
  module Payments
    module Refunds
      module Types
        module UnreferencedRefundChannel
          extend Payroc::Internal::Types::Enum

          POS = "pos"
          MOTO = "moto"
        end
      end
    end
  end
end
