# frozen_string_literal: true

require_relative "version"

module Payroc
  # Sentry integration for error tracking and monitoring.
  #
  # Users can opt-out by setting the PAYROC_DISABLE_SENTRY environment variable
  # to 'true', '1', or 'yes'.
  module SentryIntegration
    DSN = "https://c3d832677ad08b915dcc3fdafc8afe26@o4505201678483456.ingest.us.sentry.io/4509367402954752"

    SENSITIVE_HEADERS = %w[
      Authorization
      authorization
      X-API-Key
      x-api-key
      API-Key
      api-key
      Token
      token
      Auth-Token
      auth-token
      Access-Token
      access-token
      Client-Secret
      client-secret
      Secret
      secret
    ].freeze

    SENSITIVE_EXTRA_KEYWORDS = %w[token key secret auth password].freeze

    BEARER_PATTERN = /(Authorization['"]?\s*:\s*['"]?Bearer\s+)[^\s'"]+/i
    X_API_KEY_PATTERN = /(x-api-key['"]?\s*:\s*['"]?)[^\s'"]+/i
    API_KEY_PATTERN = /(api[_-]?key['"]?\s*[:=]\s*['"]?)[^\s'"]+/i

    REDACTED = "[REDACTED]"

    @initialized = false

    class << self
      # Initialize Sentry for error tracking and monitoring.
      def initialize!
        return if @initialized
        return if disabled?

        begin
          require "sentry-ruby"

          Sentry.init do |config|
            config.dsn = DSN
            # DO NOT send PII to protect user privacy and credentials
            config.send_default_pii = false
            # Set traces_sample_rate to 1.0 to capture 100% of transactions for tracing
            config.traces_sample_rate = 1.0
            # Set release version for better tracking
            config.release = sdk_version
            # Configure environment
            config.environment = ENV.fetch("PAYROC_ENVIRONMENT", "production")
            # Filter sensitive data before sending to Sentry
            config.before_send = method(:before_send)
          end

          @initialized = true
        rescue LoadError
          # sentry-ruby not available
        rescue StandardError
          # Initialization error - don't break SDK
        end
      end

      private

      def disabled?
        disable_sentry = ENV.fetch("PAYROC_DISABLE_SENTRY", nil)
        return false if disable_sentry.nil?

        %w[true 1 yes].include?(disable_sentry.downcase)
      end

      def before_send(event, _hint)
        redact_request_headers(event)
        redact_exception_messages(event)
        redact_extra_context(event)
        event
      end

      def redact_request_headers(event)
        return unless event.request&.headers

        SENSITIVE_HEADERS.each do |header|
          event.request.headers[header] = REDACTED if event.request.headers.key?(header)
        end
      end

      def redact_exception_messages(event)
        return unless event.exception&.values

        event.exception.each_value do |exception|
          next unless exception.value

          value = exception.value
          value = value.gsub(BEARER_PATTERN, "\\1#{REDACTED}")
          value = value.gsub(X_API_KEY_PATTERN, "\\1#{REDACTED}")
          value = value.gsub(API_KEY_PATTERN, "\\1#{REDACTED}")
          exception.value = value
        end
      end

      def redact_extra_context(event)
        return unless event.extra

        event.extra.each_key do |key|
          lower_key = key.to_s.downcase
          event.extra[key] = REDACTED if SENSITIVE_EXTRA_KEYWORDS.any? { |sensitive| lower_key.include?(sensitive) }
        end
      end

      def sdk_version
        "payroc-ruby-sdk@#{Payroc::VERSION}"
      end
    end
  end
end

# Auto-initialize Sentry when the module is loaded
Payroc::SentryIntegration.initialize!
