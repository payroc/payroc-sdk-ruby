# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the processor fees.
    class ProcessorFee < Internal::Types::Model
      field :volume, -> { Integer }, optional: true, nullable: false
      field :transaction, -> { Integer }, optional: true, nullable: false
    end
  end
end
