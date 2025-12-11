# frozen_string_literal: true

module Payroc
  module Boarding
    module Owners
      module Types
        class UpdateOwnersRequest < Internal::Types::Model
          field :owner_id, -> { Integer }, optional: false, nullable: false, api_name: "ownerId"
          field :body, -> { Payroc::Types::Owner }, optional: false, nullable: false
        end
      end
    end
  end
end
