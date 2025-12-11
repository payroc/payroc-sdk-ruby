# frozen_string_literal: true

module Payroc
  module Types
    class PaymentMethodAch < Internal::Types::Model
      field :value, -> { Payroc::Types::PaymentMethodAchValue }, optional: true, nullable: false
    end
  end
end
