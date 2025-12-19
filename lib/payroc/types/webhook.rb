# frozen_string_literal: true

module Payroc
  module Types
    class Webhook < Internal::Types::Model
      field :uri, -> { String }, optional: false, nullable: false
      field :secret, -> { String }, optional: false, nullable: false
      field :support_email_address, -> { String }, optional: false, nullable: false, api_name: "supportEmailAddress"
    end
  end
end
