# frozen_string_literal: true

module Payroc
  module Types
    # Object that contains information about the authorization.
    class AuthorizationSummary < Internal::Types::Model
      field :authorization_id, -> { Integer }, optional: true, nullable: false, api_name: "authorizationId"
      field :code, -> { String }, optional: true, nullable: false
      field :amount, -> { Integer }, optional: true, nullable: false
      field :avs_response_code, -> { String }, optional: true, nullable: false, api_name: "avsResponseCode"
      field :link, -> { Payroc::Types::Link }, optional: true, nullable: false
    end
  end
end
