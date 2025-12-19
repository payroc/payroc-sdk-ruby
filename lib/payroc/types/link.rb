# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains HATEOAS links for the resource.
    class Link < Internal::Types::Model
      field :rel, -> { String }, optional: false, nullable: false
      field :method_, -> { String }, optional: false, nullable: false, api_name: "method"
      field :href, -> { String }, optional: false, nullable: false
    end
  end
end
