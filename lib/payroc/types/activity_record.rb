# frozen_string_literal: true

module Payroc
  module Types
    # Array of activityRecord objects.
    class ActivityRecord < Internal::Types::Model
      field :id, -> { Integer }, optional: false, nullable: false
      field :date, -> { String }, optional: false, nullable: false
      field :merchant, -> { String }, optional: false, nullable: false
      field :recipient, -> { String }, optional: true, nullable: false
      field :description, -> { String }, optional: false, nullable: false
      field :amount, -> { Integer }, optional: false, nullable: false
      field :type, -> { Payroc::Types::ActivityRecordType }, optional: false, nullable: false
      field :currency, -> { String }, optional: false, nullable: false
    end
  end
end
