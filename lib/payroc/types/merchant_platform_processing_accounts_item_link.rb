# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains HATEOAS links for the processing account.
    class MerchantPlatformProcessingAccountsItemLink < Internal::Types::Model
      field :rel, -> { String }, optional: true, nullable: false
      field :href, -> { String }, optional: true, nullable: false
      field :method_, -> { String }, optional: true, nullable: false, api_name: "method"
    end
  end
end
