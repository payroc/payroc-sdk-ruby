# frozen_string_literal: true

module Payroc
  module Types
    class ApplePayResponseSession < Internal::Types::Model
      field :start_session_response, -> { String }, optional: false, nullable: false, api_name: "startSessionResponse"
    end
  end
end
