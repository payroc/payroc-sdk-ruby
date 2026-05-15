# frozen_string_literal: true

module Payroc
  module Types
    class ClosedLoopResponse < Internal::Types::Model
      field :processing_terminal_id, -> { String }, optional: false, nullable: false, api_name: "processingTerminalId"
      field :closed_loop_read_id, -> { String }, optional: false, nullable: false, api_name: "closedLoopReadId"
      field :read_date, -> { String }, optional: false, nullable: false, api_name: "readDate"
      field :data, -> { Internal::Types::Hash[String, Object] }, optional: false, nullable: false
    end
  end
end
