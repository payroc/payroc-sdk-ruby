# frozen_string_literal: true

module Payroc
  module Types
    # Contains the pagination properties that you use to navigate through a list of results.
    class PaginatedList < Internal::Types::Model
      field :limit, -> { Integer }, optional: true, nullable: false
      field :count, -> { Integer }, optional: true, nullable: false
      field :has_more, -> { Internal::Types::Boolean }, optional: true, nullable: false, api_name: "hasMore"
      field :links, -> { Internal::Types::Array[Payroc::Types::Link] }, optional: true, nullable: false
    end
  end
end
