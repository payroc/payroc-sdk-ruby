# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the base fees.
    class BaseIntent < Internal::Types::Model
      field :id, -> { String }, optional: true, nullable: false
      field :created_date, -> { String }, optional: true, nullable: false, api_name: "createdDate"
      field :last_updated_date, -> { String }, optional: true, nullable: false, api_name: "lastUpdatedDate"
      field :status, -> { Payroc::Types::BaseIntentStatus }, optional: true, nullable: false
      field :key, -> { String }, optional: false, nullable: false
      field :metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false
    end
  end
end
