# frozen_string_literal: true

module Payroc
  module Types
    # If you don't use our Subscriptions mechanism, include this section to configure your standing/recurring orders.
    class StandingInstructions < Internal::Types::Model
      field :sequence, -> { Payroc::Types::StandingInstructionsSequence }, optional: false, nullable: false
      field :processing_model, -> { Payroc::Types::StandingInstructionsProcessingModel }, optional: false, nullable: false, api_name: "processingModel"
      field :reference_data_of_first_txn, -> { Payroc::Types::FirstTxnReferenceData }, optional: true, nullable: false, api_name: "referenceDataOfFirstTxn"
    end
  end
end
