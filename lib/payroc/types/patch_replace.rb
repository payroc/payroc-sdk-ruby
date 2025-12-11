# frozen_string_literal: true

module Payroc
  module Types
    # A Patch Replace Operation.
    class PatchReplace < Internal::Types::Model
      field :path, -> { String }, optional: false, nullable: false
      field :value, -> { Object }, optional: false, nullable: false
    end
  end
end
