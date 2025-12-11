# frozen_string_literal: true

module Payroc
  module Types
    # A Patch Move Operation.
    class PatchMove < Internal::Types::Model
      field :from, -> { String }, optional: false, nullable: false
      field :path, -> { String }, optional: false, nullable: false
    end
  end
end
