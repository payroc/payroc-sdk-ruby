# frozen_string_literal: true

module Payroc
  module Boarding
    module Contacts
      module Types
        class UpdateContactsRequest < Internal::Types::Model
          field :contact_id, -> { Integer }, optional: false, nullable: false, api_name: "contactId"
          field :body, -> { Payroc::Types::Contact }, optional: false, nullable: false
        end
      end
    end
  end
end
