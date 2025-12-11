# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the monthly processing amounts for the processing account.
    class ProcessingMonthlyAmounts < Internal::Types::Model
      field :average, -> { Integer }, optional: false, nullable: false
      field :highest, -> { Integer }, optional: false, nullable: false
    end
  end
end
