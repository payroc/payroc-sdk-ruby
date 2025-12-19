# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the encryption details of the POS terminal.
    class EncryptionCapableDevice < Internal::Types::Model
      field :data_ksn, -> { String }, optional: true, nullable: false, api_name: "dataKsn"
    end
  end
end
