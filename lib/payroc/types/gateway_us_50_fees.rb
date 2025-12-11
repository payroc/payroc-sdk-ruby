# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the gateway fees.
    class GatewayUs50Fees < Internal::Types::Model
      field :monthly, -> { Integer }, optional: false, nullable: false
      field :setup, -> { Integer }, optional: false, nullable: false
      field :per_transaction, -> { Integer }, optional: false, nullable: false, api_name: "perTransaction"
      field :per_device_monthly, -> { Integer }, optional: false, nullable: false, api_name: "perDeviceMonthly"
    end
  end
end
