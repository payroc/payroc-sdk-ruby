# frozen_string_literal: true

module Payroc
  module PayrocCloud
    module ClosedLoopReads
      module Types
        class RetrieveClosedLoopReadsRequest < Internal::Types::Model
          field :closed_loop_read_id, -> { String }, optional: false, nullable: false, api_name: "closedLoopReadId"
        end
      end
    end
  end
end
