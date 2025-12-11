# frozen_string_literal: true

module Payroc
  module Types
    # Indicates how authorized transactions will be batched for settlement
    class SchemasAutomaticBatchClose < Internal::Types::Model
      field :batch_close_time, -> { String }, optional: false, nullable: false, api_name: "batchCloseTime"
    end
  end
end
