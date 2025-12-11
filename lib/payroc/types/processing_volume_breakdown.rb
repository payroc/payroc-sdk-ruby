# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the types of transactions ran by the processing account. The percentages
    # for transaction types must total 100%.
    class ProcessingVolumeBreakdown < Internal::Types::Model
      field :card_present_keyed, -> { Integer }, optional: false, nullable: false, api_name: "cardPresentKeyed"
      field :card_present_swiped, -> { Integer }, optional: false, nullable: false, api_name: "cardPresentSwiped"
      field :mail_or_telephone, -> { Integer }, optional: false, nullable: false, api_name: "mailOrTelephone"
      field :ecommerce, -> { Integer }, optional: false, nullable: false
    end
  end
end
