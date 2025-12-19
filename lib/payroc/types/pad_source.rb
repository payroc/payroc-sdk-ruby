# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains the customer's account details.
    class PadSource < Internal::Types::Model
      field :name_on_account, -> { String }, optional: false, nullable: false, api_name: "nameOnAccount"
      field :account_number, -> { String }, optional: false, nullable: false, api_name: "accountNumber"
      field :transit_number, -> { String }, optional: false, nullable: false, api_name: "transitNumber"
      field :institution_number, -> { String }, optional: false, nullable: false, api_name: "institutionNumber"
    end
  end
end
