# frozen_string_literal: true

module Payroc
  module Types
    class PaginatedProcessingAccounts < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Payroc::Types::ProcessingAccount] }, optional: true, nullable: false
    end
  end
end
