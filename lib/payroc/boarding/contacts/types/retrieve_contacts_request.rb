# frozen_string_literal: true

module Payroc
  module Boarding
    module Contacts
      module Types
        class RetrieveContactsRequest < Internal::Types::Model
          field :contact_id, -> { Integer }, optional: false, nullable: false, api_name: "contactId"
        end
      end
    end
  end
end
