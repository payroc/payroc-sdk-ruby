# frozen_string_literal: true

module Payroc
  module Types
    class BaseUsAnnual < Internal::Types::Model
      field :amount, -> { Integer }, optional: true, nullable: false
    end
  end
end
