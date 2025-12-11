# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the transaction if the merchant ran it when the terminal was offline.
    class OfflineProcessing < Internal::Types::Model
      field :operation, -> { Payroc::Types::OfflineProcessingOperation }, optional: false, nullable: false
      field :approval_code, -> { String }, optional: true, nullable: false, api_name: "approvalCode"
      field :date_time, -> { String }, optional: true, nullable: false, api_name: "dateTime"
    end
  end
end
