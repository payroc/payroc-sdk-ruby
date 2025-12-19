# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains signature information if we captured the merchant’s signature by direct link.
    class SignatureByDirectLink < Internal::Types::Model
      field :link, -> { Payroc::Types::Link }, optional: true, nullable: false
    end
  end
end
