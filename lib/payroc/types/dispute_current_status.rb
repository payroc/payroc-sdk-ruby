# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the current status of the dispute.
    class DisputeCurrentStatus < Internal::Types::Model
      field :link, -> { Payroc::Types::Link }, optional: true, nullable: false
    end
  end
end
