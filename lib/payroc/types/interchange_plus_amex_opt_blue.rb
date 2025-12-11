# frozen_string_literal: true

module Payroc
  module Types
    class InterchangePlusAmexOptBlue < Internal::Types::Model
      field :volume, -> { Integer }, optional: false, nullable: false
      field :transaction, -> { Integer }, optional: false, nullable: false
    end
  end
end
