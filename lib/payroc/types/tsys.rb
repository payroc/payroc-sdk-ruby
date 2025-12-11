# frozen_string_literal: true

module Payroc
  module Types
    class Tsys < Internal::Types::Model
      field :merchant, -> { Payroc::Types::TsysMerchant }, optional: false, nullable: false
      field :terminal, -> { Payroc::Types::TsysTerminal }, optional: false, nullable: false
    end
  end
end
