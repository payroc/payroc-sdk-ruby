# frozen_string_literal: true

module Payroc
  module Types
    module OfflineProcessingOperation
      extend Payroc::Internal::Types::Enum

      OFFLINE_DECLINE = "offlineDecline"
      OFFLINE_APPROVAL = "offlineApproval"
      DEFERRED_AUTHORIZATION = "deferredAuthorization"
    end
  end
end
