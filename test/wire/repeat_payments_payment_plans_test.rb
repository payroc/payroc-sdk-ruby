# frozen_string_literal: true

require_relative "wiremock_test_case"

class RepeatPaymentsPaymentPlansWireTest < WireMockTestCase
  def setup
    super

    @client = Payroc::Client.new(
      api_key: "test-api-key",
      base_url: WIREMOCK_BASE_URL
    )
  end

  def test_repeat_payments_payment_plans_list_with_wiremock
    test_id = "repeat_payments.payment_plans.list.0"

    @client.repeat_payments.payment_plans.list(
      processing_terminal_id: "1234001",
      before: "2571",
      after: "8516",
      limit: 1,
      request_options: {
        additional_headers: {
          "X-Test-Id" => "repeat_payments.payment_plans.list.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/processing-terminals/1234001/payment-plans",
      query_params: nil,
      expected: 1
    )
  end

  def test_repeat_payments_payment_plans_create_with_wiremock
    test_id = "repeat_payments.payment_plans.create.0"

    @client.repeat_payments.payment_plans.create(
      processing_terminal_id: "1234001",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      payment_plan_id: "PlanRef8765",
      name: "Premium Club",
      description: "Monthly Premium Club subscription",
      currency: "USD",
      length: 12,
      type: "automatic",
      frequency: "monthly",
      on_update: "continue",
      on_delete: "complete",
      custom_field_names: ["yourCustomField"],
      setup_order: {
        amount: 4999,
        description: "Initial setup fee for Premium Club subscription",
        breakdown: {
          subtotal: 4347,
          taxes: [{
            name: "Sales Tax",
            rate: 5
          }]
        }
      },
      recurring_order: {
        amount: 4999,
        description: "Monthly Premium Club subscription",
        breakdown: {
          subtotal: 4347,
          taxes: [{
            name: "Sales Tax",
            rate: 5
          }]
        }
      },
      request_options: {
        additional_headers: {
          "X-Test-Id" => "repeat_payments.payment_plans.create.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "POST",
      url_path: "/processing-terminals/1234001/payment-plans",
      query_params: nil,
      expected: 1
    )
  end

  def test_repeat_payments_payment_plans_retrieve_with_wiremock
    test_id = "repeat_payments.payment_plans.retrieve.0"

    @client.repeat_payments.payment_plans.retrieve(
      processing_terminal_id: "1234001",
      payment_plan_id: "PlanRef8765",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "repeat_payments.payment_plans.retrieve.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "GET",
      url_path: "/processing-terminals/1234001/payment-plans/PlanRef8765",
      query_params: nil,
      expected: 1
    )
  end

  def test_repeat_payments_payment_plans_delete_with_wiremock
    test_id = "repeat_payments.payment_plans.delete.0"

    @client.repeat_payments.payment_plans.delete(
      processing_terminal_id: "1234001",
      payment_plan_id: "PlanRef8765",
      request_options: {
        additional_headers: {
          "X-Test-Id" => "repeat_payments.payment_plans.delete.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "DELETE",
      url_path: "/processing-terminals/1234001/payment-plans/PlanRef8765",
      query_params: nil,
      expected: 1
    )
  end

  def test_repeat_payments_payment_plans_partially_update_with_wiremock
    test_id = "repeat_payments.payment_plans.partially_update.0"

    @client.repeat_payments.payment_plans.partially_update(
      processing_terminal_id: "1234001",
      payment_plan_id: "PlanRef8765",
      idempotency_key: "8e03978e-40d5-43e8-bc93-6894a57f9324",
      request: [],
      request_options: {
        additional_headers: {
          "X-Test-Id" => "repeat_payments.payment_plans.partially_update.0"
        }
      }
    )

    verify_request_count(
      test_id: test_id,
      method: "PATCH",
      url_path: "/processing-terminals/1234001/payment-plans/PlanRef8765",
      query_params: nil,
      expected: 1
    )
  end
end
