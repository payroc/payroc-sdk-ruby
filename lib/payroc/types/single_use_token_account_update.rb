# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the token.
    class SingleUseTokenAccountUpdate < Internal::Types::Model
      field :token, -> { String }, optional: false, nullable: false
    end
  end
end
