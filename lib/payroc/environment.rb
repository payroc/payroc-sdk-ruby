# frozen_string_literal: true

module Payroc
  class Environment
    PRODUCTION = { api: "https://api.payroc.com/v1", identity: "https://identity.payroc.com" }.freeze
    UAT = { api: "https://api.uat.payroc.com/v1", identity: "https://identity.uat.payroc.com" }.freeze
  end
end
