# frozen_string_literal: true

module Payroc
  module Tokenization
    module SingleUseTokens
      module Types
        module SingleUseTokenRequestChannel
          extend Payroc::Internal::Types::Enum

          POS = "pos"
          WEB = "web"
          MOTO = "moto"
        end
      end
    end
  end
end
