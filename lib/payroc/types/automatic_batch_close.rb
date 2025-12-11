# frozen_string_literal: true

module Payroc
  module Types
    # Indicates how the merchant batches their transactions.
    class AutomaticBatchClose < Internal::Types::Model
      field :batch_close_time, -> { String }, optional: true, nullable: false, api_name: "batchCloseTime"
    end
  end
end
