# frozen_string_literal: true

module Payroc
  module Types
    class EventSubscription < Internal::Types::Model
      field :id, -> { Integer }, optional: true, nullable: false
      field :enabled, -> { Internal::Types::Boolean }, optional: false, nullable: false
      field :status, -> { Payroc::Types::EventSubscriptionStatus }, optional: true, nullable: false
      field :event_types, -> { Internal::Types::Array[String] }, optional: false, nullable: false, api_name: "eventTypes"
      field :notifications, -> { Internal::Types::Array[Payroc::Types::Notification] }, optional: false, nullable: false
      field :metadata, -> { Internal::Types::Hash[String, Object] }, optional: true, nullable: false
    end
  end
end
