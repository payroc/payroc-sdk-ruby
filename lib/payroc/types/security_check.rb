# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about card verification and security checks.
    class SecurityCheck < Internal::Types::Model
      field :cvv_result, -> { Payroc::Types::SecurityCheckCvvResult }, optional: true, nullable: false, api_name: "cvvResult"
      field :avs_result, -> { Payroc::Types::SecurityCheckAvsResult }, optional: true, nullable: false, api_name: "avsResult"
    end
  end
end
