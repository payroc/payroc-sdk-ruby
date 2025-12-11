# frozen_string_literal: true

module Payroc
  module Types
    # Array of links related to your request. For more information about HATEOAS, go to [Hypermedia as the engine of
    # application
    # state](https://docs.payroc.com/knowledge/basic-concepts/hypermedia-as-the-engine-of-application-state-hateoas).
    class ProcessingTerminalSummaryLink < Internal::Types::Model
      field :href, -> { String }, optional: false, nullable: false
      field :rel, -> { String }, optional: false, nullable: false
      field :method_, -> { String }, optional: false, nullable: false, api_name: "method"
    end
  end
end
