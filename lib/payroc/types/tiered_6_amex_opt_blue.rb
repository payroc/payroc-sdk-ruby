# frozen_string_literal: true

module Payroc
  module Types
    class Tiered6AmexOptBlue < Internal::Types::Model
      field :qualified_rate, -> { Payroc::Types::ProcessorFee }, optional: false, nullable: false, api_name: "qualifiedRate"
      field :mid_qual_rate, -> { Payroc::Types::ProcessorFee }, optional: false, nullable: false, api_name: "midQualRate"
      field :non_qual_rate, -> { Payroc::Types::ProcessorFee }, optional: false, nullable: false, api_name: "nonQualRate"
    end
  end
end
