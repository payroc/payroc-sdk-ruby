# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the gateway fees.
    class GatewayUsFees < Internal::Types::Model
      field :monthly, -> { Integer }, optional: false, nullable: false
      field :setup, -> { Integer }, optional: false, nullable: false
      field :per_transaction, -> { Integer }, optional: false, nullable: false, api_name: "perTransaction"
      field :per_device_monthly, -> { Integer }, optional: false, nullable: false, api_name: "perDeviceMonthly"
      field :additional_service_monthly, -> { Integer }, optional: false, nullable: false, api_name: "additionalServiceMonthly"
    end
  end
end
