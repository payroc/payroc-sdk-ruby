# frozen_string_literal: true

module Payroc
  module Types
    module ContactType
      extend Payroc::Internal::Types::Enum

      MANAGER = "manager"
      REPRESENTATIVE = "representative"
      OTHERS = "others"
    end
  end
end
