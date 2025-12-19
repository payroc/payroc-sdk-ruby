# frozen_string_literal: true

module Payroc
  module Auth
    module Types
      class RetrieveTokenAuthRequest < Internal::Types::Model
        field :api_key, -> { String }, optional: false, nullable: false, api_name: "x-api-key"
      end
    end
  end
end
