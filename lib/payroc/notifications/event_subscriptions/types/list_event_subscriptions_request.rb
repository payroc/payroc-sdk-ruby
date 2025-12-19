# frozen_string_literal: true

module Payroc
  module Notifications
    module EventSubscriptions
      module Types
        class ListEventSubscriptionsRequest < Internal::Types::Model
          field :status, -> { Payroc::Notifications::EventSubscriptions::Types::ListEventSubscriptionsRequestStatus }, optional: true, nullable: false
          field :event, -> { String }, optional: true, nullable: false
        end
      end
    end
  end
end
