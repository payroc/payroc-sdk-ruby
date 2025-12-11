# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the contact details of the recipient.
    class PaymentLinkEmailRecipient < Internal::Types::Model
      field :name, -> { String }, optional: false, nullable: false
      field :email, -> { String }, optional: false, nullable: false
    end
  end
end
