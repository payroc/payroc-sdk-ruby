# frozen_string_literal: true

module Payroc
  module Types
    # A Patch Remove Operation.
    class PatchRemove < Internal::Types::Model
      field :path, -> { String }, optional: false, nullable: false
    end
  end
end
