# frozen_string_literal: true

module Payroc
  module Types
    # Inform the payfac what to do with the specified funds. **
    class Instruction < Internal::Types::Model
      field :instruction_id, -> { Integer }, optional: true, nullable: false, api_name: "instructionId"
      field :created_date, -> { String }, optional: true, nullable: false, api_name: "createdDate"
      field :last_modified_date, -> { String }, optional: true, nullable: false, api_name: "lastModifiedDate"
      field :status, -> { Payroc::Types::InstructionStatus }, optional: true, nullable: false
      field :merchants, -> { Internal::Types::Array[Payroc::Types::InstructionMerchantsItem] }, optional: true, nullable: false
      field :metadata, -> { Internal::Types::Hash[String, String] }, optional: true, nullable: false
    end
  end
end
