# frozen_string_literal: true

module Payroc
  module Types
    class Notification < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :type

      member -> { Payroc::Types::Webhook }, key: "WEBHOOK"
    end
  end
end
