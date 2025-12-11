# frozen_string_literal: true

module Payroc
  module Types
    module SecureTokenPayloadSecCode
      extend Payroc::Internal::Types::Enum

      WEB = "web"
      TEL = "tel"
      CCD = "ccd"
      PPD = "ppd"
    end
  end
end
