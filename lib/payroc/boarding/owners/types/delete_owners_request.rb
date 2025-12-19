# frozen_string_literal: true

module Payroc
  module Boarding
    module Owners
      module Types
        class DeleteOwnersRequest < Internal::Types::Model
          field :owner_id, -> { Integer }, optional: false, nullable: false, api_name: "ownerId"
        end
      end
    end
  end
end
