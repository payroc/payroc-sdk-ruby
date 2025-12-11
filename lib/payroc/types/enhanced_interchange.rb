# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the fees for enhanced interchange services.
    class EnhancedInterchange < Internal::Types::Model
      field :enrollment, -> { Integer }, optional: false, nullable: false
      field :credit_to_merchant, -> { Integer }, optional: false, nullable: false, api_name: "creditToMerchant"
    end
  end
end
