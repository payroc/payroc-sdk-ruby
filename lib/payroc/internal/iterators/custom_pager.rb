# frozen_string_literal: true

require "json"

# Custom Pagination Support
#
# This file implements HATEOAS pagination for the Payroc API.
# It parses responses with `data` and `links` fields to provide
# pagination navigation.

module Payroc
  module Internal
    # PayrocPager wraps a paginated response and provides navigation methods.
    # This pager supports HATEOAS-style pagination with `links` containing
    # `next` and `previous` URLs.
    class PayrocPager
      include Enumerable

      # @return [Object] The current page response
      attr_reader :current

      # Creates a new custom pager with the given initial response.
      #
      # @param initial [Object] The initial page response
      # @param item_field [Symbol, nil] The field name containing items for iteration
      # @param raw_client [Object, nil] The HTTP client for fetching additional pages
      # @param has_next_proc [Proc, nil] A proc that returns true if there's a next page
      # @param has_prev_proc [Proc, nil] A proc that returns true if there's a previous page
      # @param get_next_proc [Proc, nil] A proc that fetches the next page
      # @param get_prev_proc [Proc, nil] A proc that fetches the previous page
      # @return [Payroc::Internal::PayrocPager]
      def initialize(initial, item_field: nil, raw_client: nil, has_next_proc: nil, has_prev_proc: nil,
                     get_next_proc: nil, get_prev_proc: nil)
        @current = initial
        @item_field = item_field
        @raw_client = raw_client
        @has_next_proc = has_next_proc
        @has_prev_proc = has_prev_proc
        @get_next_proc = get_next_proc
        @get_prev_proc = get_prev_proc

        # Parse HATEOAS links from the response
        parse_links(initial)
      end

      # Returns true if there is a next page available.
      #
      # @return [Boolean]
      def next_page?
        return @has_next_proc.call(@current) if @has_next_proc

        !@next_url.nil?
      end

      # Returns true if there is a previous page available.
      #
      # @return [Boolean]
      def prev_page?
        return @has_prev_proc.call(@current) if @has_prev_proc

        !@previous_url.nil?
      end

      # Alias for prev_page?
      alias previous_page? prev_page?

      # Returns the next page URL if available.
      #
      # @return [String, nil] The next page URL
      def next_page_url
        @next_url
      end

      # Returns the previous page URL if available.
      #
      # @return [String, nil] The previous page URL
      def previous_page_url
        @previous_url
      end

      # Fetches the next page of results.
      #
      # @return [Object, nil] The next page response, or nil if not available
      def next_page
        return nil unless next_page?

        if @get_next_proc
          @current = @get_next_proc.call(@current)
          parse_links(@current)
          return @current
        end

        # Use raw_client to fetch the next page via HATEOAS link
        if @raw_client && @next_url
          @current = fetch_page(@next_url)
          parse_links(@current)
          return @current
        end

        nil
      end

      # Fetches the previous page of results.
      #
      # @return [Object, nil] The previous page response, or nil if not available
      def prev_page
        return nil unless prev_page?

        if @get_prev_proc
          @current = @get_prev_proc.call(@current)
          parse_links(@current)
          return @current
        end

        # Use raw_client to fetch the previous page via HATEOAS link
        if @raw_client && @previous_url
          @current = fetch_page(@previous_url)
          parse_links(@current)
          return @current
        end

        nil
      end

      # Alias for prev_page
      alias previous_page prev_page

      # Iterates over each page of results.
      #
      # @param block [Proc] The block to yield each page to
      # @return [NilClass]
      def each_page(&block)
        return enum_for(:each_page) unless block_given?

        page = @current
        loop do
          block.call(page)
          break unless next_page?

          page = next_page
          break if page.nil?
        end
      end

      # Iterates over each item in all pages.
      # Requires item_field to be set.
      #
      # @param block [Proc] The block to yield each item to
      # @return [NilClass]
      def each(&block)
        return enum_for(:each) unless block_given?
        return each_page(&block) if @item_field.nil?

        each_page do |page|
          items = extract_items(page)
          items.each { |item| block.call(item) }
        end
      end

      private

      # Parses HATEOAS links from a response object.
      #
      # @param response [Object] The response to parse links from
      # @return [NilClass]
      def parse_links(response)
        @next_url = nil
        @previous_url = nil

        links = extract_field(response, :links)
        return if links.nil? || !links.is_a?(Array)

        links.each do |link|
          rel = extract_field(link, :rel)
          href = extract_field(link, :href)

          case rel
          when "next"
            @next_url = href
          when "previous"
            @previous_url = href
          end
        end
      end

      # Extracts items from a page using the item_field.
      #
      # @param page [Object] The page to extract items from
      # @return [Array] The items
      def extract_items(page)
        return [] if @item_field.nil?

        items = extract_field(page, @item_field)
        items.is_a?(Array) ? items : []
      end

      # Extracts a field from an object, handling both objects with methods and hashes.
      #
      # @param obj [Object, Hash] The object to extract from
      # @param field [Symbol] The field name to extract
      # @return [Object, nil] The field value or nil
      def extract_field(obj, field)
        if obj.is_a?(Hash)
          obj[field] || obj[field.to_s]
        elsif obj.respond_to?(field)
          obj.send(field)
        end
      end

      # Fetches a page from the given URL using the raw client.
      #
      # @param url [String] The URL to fetch
      # @return [Hash] The parsed response as a hash with symbolized keys
      def fetch_page(url)
        request = Payroc::Internal::JSON::Request.new(
          path: url,
          method: "GET",
          headers: {},
          query: {},
          body: nil,
          base_url: "" # Empty since URL from HATEOAS link is absolute
        )

        response = @raw_client.send(request)
        ::JSON.parse(response.body, symbolize_names: true)
      end
    end
  end
end
