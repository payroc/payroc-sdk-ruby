# frozen_string_literal: true

module Payroc
  module Types
    module PlainTextSwipedDataFormatFallbackReason
      extend Payroc::Internal::Types::Enum

      TECHNICAL = "technical"
      REPEAT_FALLBACK = "repeatFallback"
      EMPTY_CANDIDATE_LIST = "emptyCandidateList"
    end
  end
end
