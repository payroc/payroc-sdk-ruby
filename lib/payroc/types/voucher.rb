# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the EBT voucher.
    #
    # **Note:** Vouchers are available only for EBT SNAP payments.
    class Voucher < Internal::Types::Model
      field :approval_code, -> { String }, optional: false, nullable: false, api_name: "approvalCode"
      field :serial_number, -> { String }, optional: false, nullable: false, api_name: "serialNumber"
    end
  end
end
