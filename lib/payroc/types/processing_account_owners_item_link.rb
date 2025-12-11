# frozen_string_literal: true

module Payroc
  module Types
    # HATEOAS links to the owners of the processing account.
    class ProcessingAccountOwnersItemLink < Internal::Types::Model
      field :rel, -> { String }, optional: true, nullable: false
      field :href, -> { String }, optional: true, nullable: false
      field :method_, -> { String }, optional: true, nullable: false, api_name: "method"
    end
  end
end
