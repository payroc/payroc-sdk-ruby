# frozen_string_literal: true

require "minitest/autorun"
require "test_helper"

# Mock response structure for testing
MockPageResponse = Struct.new(:data, :links, keyword_init: true)
MockLink = Struct.new(:rel, :href, keyword_init: true)

class PayrocPagerTest < Minitest::Test
  def setup
    @page_1_data = [{ id: 1 }, { id: 2 }]
    @page_2_data = [{ id: 3 }, { id: 4 }]
    @page_3_data = [{ id: 5 }]

    @page_1 = MockPageResponse.new(
      data: @page_1_data,
      links: [
        MockLink.new(rel: "next", href: "https://api.example.com/page2"),
        MockLink.new(rel: "previous", href: nil)
      ]
    )

    @page_2 = MockPageResponse.new(
      data: @page_2_data,
      links: [
        MockLink.new(rel: "next", href: "https://api.example.com/page3"),
        MockLink.new(rel: "previous", href: "https://api.example.com/page1")
      ]
    )

    @page_3 = MockPageResponse.new(
      data: @page_3_data,
      links: [
        MockLink.new(rel: "previous", href: "https://api.example.com/page2")
      ]
    )

    @fetch_count = 0
    @mock_client = Object.new
    def @mock_client.send(request)
      # Mock HTTP response
      MockResponse = Struct.new(:body)
      case request.path
      when "https://api.example.com/page2"
        MockResponse.new('{"data":[{"id":3},{"id":4}],"links":[{"rel":"next","href":"https://api.example.com/page3"},{"rel":"previous","href":"https://api.example.com/page1"}]}')
      when "https://api.example.com/page3"
        MockResponse.new('{"data":[{"id":5}],"links":[{"rel":"previous","href":"https://api.example.com/page2"}]}')
      else
        MockResponse.new('{"data":[]}')
      end
    end
  end

  def test_pager_detects_next_page_from_links
    pager = Payroc::Internal::PayrocPager.new(@page_1, item_field: :data, raw_client: @mock_client)

    assert pager.next_page?, "Should detect next page from links"
    refute pager.prev_page?, "Should not detect previous page"
  end

  def test_pager_detects_no_next_page_when_links_empty
    pager = Payroc::Internal::PayrocPager.new(@page_3, item_field: :data, raw_client: @mock_client)

    refute pager.next_page?, "Should not detect next page when no next link"
    assert pager.prev_page?, "Should detect previous page"
  end

  def test_pager_fetches_next_page_via_hateoas_link
    pager = Payroc::Internal::PayrocPager.new(@page_1, item_field: :data, raw_client: @mock_client)

    assert pager.next_page?, "Should have next page"
    
    next_page = pager.next_page
    refute_nil next_page, "Should fetch next page"
    
    # Verify the fetched page has the correct data
    items = next_page[:data]
    assert_equal 2, items.length
    assert_equal 3, items[0][:id]
    assert_equal 4, items[1][:id]
  end

  def test_pager_iterates_through_all_pages
    pager = Payroc::Internal::PayrocPager.new(@page_1, item_field: :data, raw_client: @mock_client)

    pages = []
    pager.each_page do |page|
      pages << page
    end

    assert_equal 3, pages.length, "Should iterate through all 3 pages"
  end

  def test_pager_iterates_through_all_items
    pager = Payroc::Internal::PayrocPager.new(@page_1, item_field: :data, raw_client: @mock_client)

    items = pager.to_a
    
    assert_equal 5, items.length, "Should iterate through all 5 items across 3 pages"
    assert_equal [{ id: 1 }, { id: 2 }, { id: 3 }, { id: 4 }, { id: 5 }], items
  end

  def test_pager_lazy_iteration
    pager = Payroc::Internal::PayrocPager.new(@page_1, item_field: :data, raw_client: @mock_client)

    # Take only first 3 items (should only fetch 2 pages)
    items = pager.first(3)
    
    assert_equal 3, items.length
    assert_equal [{ id: 1 }, { id: 2 }, { id: 3 }], items
  end

  def test_pager_with_hash_response
    # Test with hash instead of struct (like what fetch_page returns)
    page_hash = {
      data: [{ id: 1 }, { id: 2 }],
      links: [
        { rel: "next", href: "https://api.example.com/page2" }
      ]
    }

    pager = Payroc::Internal::PayrocPager.new(page_hash, item_field: :data, raw_client: @mock_client)

    assert pager.next_page?, "Should detect next page from hash"
    assert_equal 2, pager.to_a.length
  end

  def test_pager_returns_enumerator_when_no_block_given
    pager = Payroc::Internal::PayrocPager.new(@page_1, item_field: :data, raw_client: @mock_client)

    enum = pager.each
    assert_kind_of Enumerator, enum
    
    # Should be able to use enumerator methods
    first_item = enum.first
    assert_equal({ id: 1 }, first_item)
  end

  def test_pager_with_custom_has_next_proc
    custom_has_next = ->(page) { page.data.length > 1 }
    
    pager = Payroc::Internal::PayrocPager.new(
      @page_1,
      item_field: :data,
      raw_client: @mock_client,
      has_next_proc: custom_has_next
    )

    assert pager.next_page?, "Custom proc should determine next page availability"
  end

  def test_pager_handles_missing_links_gracefully
    page_no_links = MockPageResponse.new(data: [{ id: 1 }], links: nil)
    
    pager = Payroc::Internal::PayrocPager.new(page_no_links, item_field: :data, raw_client: @mock_client)

    refute pager.next_page?, "Should handle missing links gracefully"
    assert_equal 1, pager.to_a.length
  end

  def test_pager_handles_empty_data
    empty_page = MockPageResponse.new(data: [], links: [])
    
    pager = Payroc::Internal::PayrocPager.new(empty_page, item_field: :data, raw_client: @mock_client)

    assert_equal 0, pager.to_a.length
  end

  def test_pager_current_returns_current_page
    pager = Payroc::Internal::PayrocPager.new(@page_1, item_field: :data, raw_client: @mock_client)

    assert_equal @page_1, pager.current
    
    pager.next_page
    refute_equal @page_1, pager.current
  end

  def test_pager_next_page_url_returns_correct_url
    pager = Payroc::Internal::PayrocPager.new(@page_1, item_field: :data, raw_client: @mock_client)

    assert_equal "https://api.example.com/page2", pager.next_page_url
  end

  def test_pager_previous_page_url_returns_nil_for_first_page
    pager = Payroc::Internal::PayrocPager.new(@page_1, item_field: :data, raw_client: @mock_client)

    assert_nil pager.previous_page_url
  end
end
