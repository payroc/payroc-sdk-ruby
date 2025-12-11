# frozen_string_literal: true

module Payroc
  module Types
    class ContactMethod < Internal::Types::Model
      extend Payroc::Internal::Types::Union

      discriminant :type

      member -> { Payroc::Types::ContactMethodEmail }, key: "EMAIL"
      member -> { Payroc::Types::ContactMethodPhone }, key: "PHONE"
      member -> { Payroc::Types::ContactMethodMobile }, key: "MOBILE"
      member -> { Payroc::Types::ContactMethodFax }, key: "FAX"
    end
  end
end
