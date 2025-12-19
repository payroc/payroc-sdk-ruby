# frozen_string_literal: true

module Payroc
  module Types
    module RewardPayFeesTips
      extend Payroc::Internal::Types::Enum

      NO_TIPS = "noTips"
      TIP_PROMPT = "tipPrompt"
      TIP_ADJUST = "tipAdjust"
    end
  end
end
