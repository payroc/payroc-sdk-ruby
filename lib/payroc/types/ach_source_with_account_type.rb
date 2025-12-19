# frozen_string_literal: true

module Payroc
  module Types
    class AchSourceWithAccountType < Internal::Types::Model
      field :account_type, -> { Payroc::Types::AchSourceWithAccountTypeAccountType }, optional: true, nullable: false, api_name: "accountType"
    end
  end
end
