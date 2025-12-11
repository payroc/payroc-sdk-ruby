# Payroc API Ruby SDK

[![gem shield](https://img.shields.io/gem/v/payroc)](https://rubygems.org/gems/payroc)

The Payroc API Ruby SDK provides convenient access to the Payroc API from Ruby.

## Contents

- [Payroc API Ruby SDK](#payroc-api-ruby-sdk)
  - [Installation](#installation)
  - [Usage](#usage)
    - [API Key](#api-key)
    - [PayrocClient](#payrocclient)
    - [Advanced Usage with Custom Environment](#advanced-usage-with-custom-environment)
  - [Exception Handling](#exception-handling)
  - [Logging](#logging)
  - [Pagination](#pagination)
  - [Request Parameters](#request-parameters)
  - [Polymorphic Types](#polymorphic-types)
    - [Creating Polymorphic Data](#creating-polymorphic-data)
    - [Handling Polymorphic Data](#handling-polymorphic-data)
  - [Advanced](#advanced)
    - [Timeouts](#timeouts)
  - [Contributing](#contributing)
  - [References](#references)

## Installation

```sh
gem install payroc
```

Or add to your Gemfile:

```ruby
gem 'payroc'
```

## Usage

### API Key

You need to provide your API Key to the `Payroc::Client` constructor. In this example we read it from an environment variable named `PAYROC_API_KEY`. In your own code you should consider security and compliance best practices, likely retrieving this value from a secure vault on demand.

### PayrocClient

Instantiate and use the client with the following:

```ruby
require "payroc"

api_key = ENV['PAYROC_API_KEY'] || raise('Payroc API Key not found')
client = Payroc::Client.new(
  base_url: Payroc::Environment::PRODUCTION,
  api_key: api_key
)
```

Then you can access the various API endpoints through the `client` object. For example, to create a payment:

```ruby
require "payroc"

result = client.payments.create(
  idempotency_key: '8e03978e-40d5-43e8-bc93-6894a57f9324',
  channel: 'web',
  processing_terminal_id: '1234001',
  operator: 'Jane',
  order: {
    order_id: 'OrderRef6543',
    description: 'Large Pepperoni Pizza',
    amount: 4999,
    currency: 'USD'
  },
  customer: {
    first_name: 'Sarah',
    last_name: 'Hopper',
    billing_address: {
      address_1: '1 Example Ave.',
      address_2: 'Example Address Line 2',
      address_3: 'Example Address Line 3',
      city: 'Chicago',
      state: 'Illinois',
      country: 'US',
      postal_code: '60056'
    },
    shipping_address: {
      recipient_name: 'Sarah Hopper',
      address: {
        address_1: '1 Example Ave.',
        address_2: 'Example Address Line 2',
        address_3: 'Example Address Line 3',
        city: 'Chicago',
        state: 'Illinois',
        country: 'US',
        postal_code: '60056'
      }
    }
  },
  payment_method: {
    card: {
      card_details: {
        raw: {
          device: {
            model: 'bbpos_chp',
            serial_number: 'PAX123456789'
          },
          raw_data: 'A1B2C3D4E5F67890ABCD1234567890ABCDEF1234567890ABCDEF1234567890ABCDEF'
        }
      }
    }
  },
  custom_fields: [{
    name: 'yourCustomField',
    value: 'abc123'
  }]
)

### Advanced Usage with Custom Environment

If you wish to use the SDK against a custom URL, such as a mock API server, you can provide a custom base URL to the `Payroc::Client` constructor:

```ruby
require "payroc"

client = Payroc::Client.new(
  base_url: "http://localhost:3000",
  api_key: api_key
)
```

You can also use the predefined UAT environment:

```ruby
require "payroc"

client = Payroc::Client.new(
  base_url: Payroc::Environment::UAT,
  api_key: api_key
)
```

## Exception Handling

When the API returns a non-success status code (4xx or 5xx response), a subclass of the following error will be thrown.

```ruby
require "payroc"

begin
  response = client.payments.create(
    # ... payment parameters
  )
rescue Payroc::Errors::ApiError => e
  puts e.message
  puts e.code if e.respond_to?(:code)
end
```

Here are the specific exceptions:

- `UnauthorizedError` (401)
- `ForbiddenError` (403)
- `NotFoundError` (404)
- `ClientError` (400-499)
- `ServiceUnavailableError` (503)
- `ServerError` (500-599)
- `TimeoutError`
- `ResponseError` (generic)

Catching a specific exception allows for more targeted error handling:

```ruby
require "payroc"

begin
  response = client.payments.create(
    # ... payment parameters
  )
rescue Payroc::Errors::TimeoutError
  puts "API didn't respond before our timeout elapsed"
rescue Payroc::Errors::ServiceUnavailableError
  puts "API returned status 503, is probably overloaded, try again later"
rescue Payroc::Errors::ServerError
  puts "API returned some other 5xx status, this is probably a bug"
rescue Payroc::Errors::ResponseError => e
  puts "API returned an unexpected status: #{e.code} #{e.message}"
rescue Payroc::Errors::ApiError => e
  puts "Some other error occurred when calling the API: #{e.message}"
end
```

## Logging

> [!WARNING]  
> Be careful when configuring your logging not to log the headers of outbound HTTP requests, lest you leak an API key or access token.

## Pagination

List endpoints are paginated. The SDK provides an enumerator so that you can simply loop over the items:

```ruby
require "payroc"

pager = client.payments.list(processing_terminal_id: '1234001')

pager.each do |payment|
  # do something with payment
end
```

The pager automatically fetches additional pages as needed when you iterate through the results.

## Request Parameters

Sometimes you need to filter results, for example, retrieving results from a given date. The SDK uses keyword arguments for setting query parameters.

Examples of setting different query parameters:

```ruby
# Filter by date range
client.payments.list(
  processing_terminal_id: '1234001',
  date_from: '2024-07-01T15:30:00.000Z'
)
```

```ruby
# Filter by date to
client.payments.list(
  processing_terminal_id: '1234001',
  date_to: '2024-07-03T15:30:00.000Z'
)
```

```ruby
# Pagination with after cursor
client.payments.list(
  processing_terminal_id: '1234001',
  after: '8516'
)
```

```ruby
# Pagination with before cursor
client.payments.list(
  processing_terminal_id: '1234001',
  before: '2571'
)
```

Refer to the [reference documentation](https://github.com/payroc/papi-sdk-ruby/blob/HEAD/./reference.md) to see what parameters are available for each method.

## Polymorphic Types

Our API makes frequent use of polymorphic data structures. This is when a value might be one of multiple types, and the type is determined at runtime. For example, a contact method can be one of several methods, such as `email` or `fax`. The SDK provides a way to handle this using Ruby's flexible hash-based approach.

### Creating Polymorphic Data

When creating polymorphic data, you specify the type using a hash with the appropriate key. For example, when creating a contact method:

```ruby
# Email contact method
email_contact = {
  email: {
    value: 'jane.doe@example.com'
  }
}

# Fax contact method
fax_contact = {
  fax: {
    value: '2025550110'
  }
}
```

In the context of a full request, polymorphic fields are nested within the request structure:

```ruby
require "payroc"

result = client.payments.create(
  # ... other parameters
  payment_method: {
    card: {
      card_details: {
        raw: {
          device: {
            model: 'bbpos_chp',
            serial_number: 'PAX123456789'
          },
          raw_data: 'A1B2C3D4E5F67890ABCD1234567890ABCDEF1234567890ABCDEF1234567890ABCDEF'
        }
      }
    }
  }
)
```

### Handling Polymorphic Data

When working with polymorphic types in SDK responses, you can check which type is present and access its properties:

```ruby
require "payroc"

owners = client.boarding.owners.retrieve(owner_id: 4564)

owners.contact_methods.each do |contact_method|
  # Access common properties
  puts "Contact Method: #{contact_method.type} - #{contact_method.value}"
  
  # Check the specific type and handle accordingly
  case contact_method.type
  when 'email'
    puts "Email: #{contact_method.value}"
    # Access email-specific properties if available
  when 'phone'
    puts "Phone: #{contact_method.value}"
  when 'mobile'
    puts "Mobile: #{contact_method.value}"
  when 'fax'
    puts "Fax: #{contact_method.value}"
  else
    puts "Unknown contact method type: #{contact_method.type}"
  end
end
```

You can also use Ruby's duck typing to handle polymorphic responses more dynamically:

```ruby
owners.contact_methods.each do |contact_method|
  if contact_method.respond_to?(:email)
    # Handle email-specific logic
    send_welcome_email(contact_method.email.value)
  elsif contact_method.respond_to?(:fax)
    # Handle fax-specific logic
    send_welcome_fax(contact_method.fax.value)
  end
end
```

## Advanced

### Timeouts

The SDK defaults to a 60 second timeout. You can configure this with a timeout option at the request level.

```ruby
require "payroc"

response = client.payments.create(
  request_options: {
    timeout_in_seconds: 30  # Override timeout to 30s
  },
  # ... other payment parameters
)
```

## Contributing

While we value open-source contributions to this SDK, this library is generated programmatically.
Additions made directly to this library would have to be moved over to our generation code,
otherwise they would be overwritten upon the next generated release. Feel free to open a PR as
a proof of concept, but know that we will not be able to merge it as-is. We suggest opening
an issue first to discuss with us!

On the other hand, contributions to the README are always very welcome!

For details on setting up your development environment, running tests, and code quality standards, please see [CONTRIBUTING.md](./CONTRIBUTING.md).

## References

A full reference for this library is available [here](https://github.com/payroc/papi-sdk-ruby/blob/HEAD/./reference.md).

The Payroc API SDK is generated via [Fern](https://www.buildwithfern.com/).

[![fern shield](https://img.shields.io/badge/%F0%9F%8C%BF-Built%20with%20Fern-brightgreen)](https://buildwithfern.com?utm_source=github&utm_medium=github&utm_campaign=readme&utm_source=https%3A%2F%2Fgithub.com%2Fpayroc%2Fpapi-sdk-ruby)