# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the host processor configuration.
    class HostConfigurationConfiguration < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :processor

      member -> { Payroc::Types::Tsys }, key: "TSYS"
    end
  end
end
