# frozen_string_literal: true

module Payroc
  module Internal
    module Types
      module Unknown
        include Payroc::Internal::Types::Type

        def coerce(value)
          value
        end
      end
    end
  end
end
