# frozen_string_literal: true

module Payroc
  module Types
    # A Patch Copy Operation.
    class PatchCopy < Internal::Types::Model
      field :from, -> { String }, optional: false, nullable: false
      field :path, -> { String }, optional: false, nullable: false
    end
  end
end
