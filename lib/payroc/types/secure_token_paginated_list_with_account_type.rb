# frozen_string_literal: true

module Payroc
  module Types
    class SecureTokenPaginatedListWithAccountType < Internal::Types::Model
      field :data, -> { Internal::Types::Array[Payroc::Types::SecureTokenWithAccountType] }, optional: true, nullable: false
    end
  end
end
