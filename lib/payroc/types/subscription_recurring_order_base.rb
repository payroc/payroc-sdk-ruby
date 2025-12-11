# frozen_string_literal: true

module Payroc
  module Types
    class SubscriptionRecurringOrderBase < Internal::Types::Model
      field :amount, -> { Integer }, optional: true, nullable: false
      field :description, -> { String }, optional: true, nullable: false
    end
  end
end
