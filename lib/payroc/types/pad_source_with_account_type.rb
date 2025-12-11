# frozen_string_literal: true

module Payroc
  module Types
    class PadSourceWithAccountType < Internal::Types::Model
      field :account_type, -> { Payroc::Types::PadSourceWithAccountTypeAccountType }, optional: true, nullable: false, api_name: "accountType"
    end
  end
end
