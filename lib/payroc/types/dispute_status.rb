# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the current status of the dispute.
    class DisputeStatus < Internal::Types::Model
      field :dispute_status_id, -> { Integer }, optional: true, nullable: false, api_name: "disputeStatusId"
      field :status, -> { Payroc::Types::DisputeStatusStatus }, optional: true, nullable: false
      field :status_date, -> { String }, optional: true, nullable: false, api_name: "statusDate"
    end
  end
end
