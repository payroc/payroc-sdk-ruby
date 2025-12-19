# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the batch. If we can't match a dispute to a batch, we don't return 'batch'
    # object.
    class BatchSummary < Internal::Types::Model
      field :batch_id, -> { Integer }, optional: true, nullable: false, api_name: "batchId"
      field :date, -> { String }, optional: true, nullable: false
      field :cycle, -> { String }, optional: true, nullable: false
      field :link, -> { Payroc::Types::Link }, optional: true, nullable: false
    end
  end
end
