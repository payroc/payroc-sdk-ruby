# frozen_string_literal: true

require_relative "wiremock_test_case"

class PayrocCloudClosedLoopReadsWireTest < WireMockTestCase
  def setup
    super

    @client = Payroc::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_payroc_cloud_closed_loop_reads_retrieve_with_wiremock
    test_id = "payroc_cloud.closed_loop_reads.retrieve.0"

    @client.payroc_cloud.closed_loop_reads.retrieve(
      closed_loop_read_id: "JDN4ILZB0T",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "payroc_cloud.closed_loop_reads.retrieve.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/closed-loop-reads/JDN4ILZB0T",
      query_params: nil,
      expected: 1
    )
  end
end
