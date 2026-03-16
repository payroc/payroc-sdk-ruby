# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the gateway fees.
    class GatewayUs52Fees < Internal::Types::Model
      field :monthly, -> { Integer }, optional: false, nullable: false
      field :setup, -> { Integer }, optional: false, nullable: false
      field :per_transaction, -> { Integer }, optional: false, nullable: false, api_name: "perTransaction"
      field :per_device_monthly, -> { Integer }, optional: false, nullable: false, api_name: "perDeviceMonthly"
      field :_3_d_secure_per_transaction, -> { Integer }, optional: true, nullable: false, api_name: "3dSecurePerTransaction"
      field :tap_to_pay_per_transaction, -> { Integer }, optional: true, nullable: false, api_name: "tapToPayPerTransaction"
    end
  end
end
