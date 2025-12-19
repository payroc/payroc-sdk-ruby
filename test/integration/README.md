# Integration Tests

This directory contains integration tests that run against the Payroc UAT environment.

## Prerequisites

Before running integration tests, you need to set the following environment variables:

- `PAYROC_API_KEY_PAYMENTS` - API key for payment operations
- `TERMINAL_ID_AVS` - Terminal ID with AVS enabled
- `TERMINAL_ID_NO_AVS` - Terminal ID without AVS (optional, for future tests)

## Running Integration Tests

To run all integration tests:

```bash
rake test TEST=test/integration/**/*_test.rb
```

To run a specific integration test:

```bash
rake test TEST=test/integration/card_payments/refunds/create_test.rb
```

## Test Structure

Integration tests are organized by API domain:

```
test/integration/
├── card_payments/
│   └── refunds/
│       └── create_test.rb
└── test_data/
    └── UnreferencedRefund.json
```

## Test Data

Test data is stored in JSON files under `test/integration/test_data/`. These files contain sample request payloads that are loaded and modified at runtime with dynamic values (e.g., idempotency keys, terminal IDs).

## Expected Behavior

When run with valid API credentials, the test should:
1. Load test data from JSON
2. Override idempotency key with a new UUID
3. Override processing terminal ID with the value from `TERMINAL_ID_AVS`
4. Create an unreferenced refund via the API
5. Assert that `transaction_result.status` equals `"ready"`

When run with expired/invalid API credentials, the test will fail with:
```
Payroc::Errors::UnauthorizedError (401)
```

This is the expected behavior until a valid API key is provided.

## Notes

- Integration tests are **fern-ignored** and will not be overwritten by code generation
- Tests are written to expect success (no graceful 401 handling)
- Tests run against the UAT environment by default
- Based on the .NET SDK integration test structure from `papi-sdk-dotnet`
