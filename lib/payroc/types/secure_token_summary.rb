# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the secure token.
    class SecureTokenSummary < Internal::Types::Model
      field :secure_token_id, -> { String }, optional: false, nullable: false, api_name: "secureTokenId"
      field :customer_name, -> { String }, optional: false, nullable: false, api_name: "customerName"
      field :token, -> { String }, optional: false, nullable: false
      field :status, -> { Payroc::Types::SecureTokenSummaryStatus }, optional: false, nullable: false
      field :link, -> { Payroc::Types::Link }, optional: true, nullable: false
    end
  end
end
