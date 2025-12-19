# frozen_string_literal: true

module Payroc
  module Types
    module ProcessingTerminalTimezone
      extend Payroc::Internal::Types::Enum

      PACIFIC_MIDWAY = "Pacific/Midway"
      PACIFIC_HONOLULU = "Pacific/Honolulu"
      AMERICA_ANCHORAGE = "America/Anchorage"
      AMERICA_LOS_ANGELES = "America/Los_Angeles"
      AMERICA_DENVER = "America/Denver"
      AMERICA_PHOENIX = "America/Phoenix"
      AMERICA_CHICAGO = "America/Chicago"
      AMERICA_INDIANA_INDIANAPOLIS = "America/Indiana/Indianapolis"
      AMERICA_NEW_YORK = "America/New_York"
    end
  end
end
