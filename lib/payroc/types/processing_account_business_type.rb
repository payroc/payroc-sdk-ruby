# frozen_string_literal: true

module Payroc
  module Types
    module ProcessingAccountBusinessType
      extend Payroc::Internal::Types::Enum

      RETAIL = "retail"
      RESTAURANT = "restaurant"
      INTERNET = "internet"
      MOTO = "moto"
      LODGING = "lodging"
      NOT_FOR_PROFIT = "notForProfit"
    end
  end
end
