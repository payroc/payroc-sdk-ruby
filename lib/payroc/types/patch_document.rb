# frozen_string_literal: true

module Payroc
  module Types
    # A JSON Patch operation as defined by RFC 6902.
    class PatchDocument < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :op

      member -> { Payroc::Types::PatchAdd }, key: "ADD"
      member -> { Payroc::Types::PatchRemove }, key: "REMOVE"
      member -> { Payroc::Types::PatchReplace }, key: "REPLACE"
      member -> { Payroc::Types::PatchMove }, key: "MOVE"
      member -> { Payroc::Types::PatchCopy }, key: "COPY"
      member -> { Payroc::Types::PatchTest }, key: "TEST"
    end
  end
end
