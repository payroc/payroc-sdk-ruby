# Contributing to Payroc API Ruby SDK

## Getting Started

### Prerequisites

To build and test this source code, you'll need:

- **Ruby 3.3.0 or higher** - [Download](https://www.ruby-lang.org/en/downloads/)
- **Bundler** - Install with `gem install bundler`
- **Git** - [Download](https://git-scm.com/)
- A code editor or IDE (e.g., VS Code, RubyMine, or Sublime Text)

### Building

Clone the repository and install dependencies:

```bash
git clone https://github.com/payroc/payroc-sdk-ruby.git
cd payroc-sdk-ruby
bundle install
```

### Project Structure

- `lib/payroc/` - Main SDK library
- `test/` - Test files
  - `test/wire/` - Wire tests for API endpoints
  - `test/custom.test.rb` - Custom test file
- `wiremock/` - WireMock configuration for testing

## Testing

### Prerequisites for Running Tests in VS Code

To run and debug tests directly in VS Code, install the following extensions:

- **[Ruby](https://marketplace.visualstudio.com/items?itemName=rebornix.ruby)** - Base Ruby language support
- **[Ruby LSP](https://marketplace.visualstudio.com/items?itemName=Shopify.ruby-lsp)** - Language server protocol for Ruby
- **[Ruby Solargraph](https://marketplace.visualstudio.com/items?itemName=castwide.solargraph)** - IntelliSense and code completion
- **[Ruby RuboCop](https://marketplace.visualstudio.com/items?itemName=misogi.ruby-rubocop)** - RuboCop linting integration

#### Quick Setup

We've provided setup scripts to automatically install these extensions. Choose the appropriate script for your operating system:

**Windows (PowerShell):**
```powershell
.\scripts\vscode\setup-extensions.ps1
```

**macOS/Linux (Bash):**
```bash
bash scripts/vscode/setup-extensions.sh
```

After running the script, reload VS Code (`Ctrl+Shift+P` > `Reload Window`) to activate the extensions.

### Test Framework

This project uses **Minitest** as the testing framework, with the following utilities:

- **Minitest** - Test framework
- **Minitest-rg** - Colorized test output
- **WebMock** - HTTP request stubbing and mocking

### Running Tests

Execute all tests:

```bash
bundle exec rake test
```

Run only custom tests:

```bash
bundle exec rake customtest
```

Run tests with verbose output:

```bash
bundle exec ruby -Ilib:test test/custom.test.rb -v
```

### Code Quality

This project uses **RuboCop** for code linting and style enforcement.

Run RuboCop:

```bash
bundle exec rake rubocop
```

Or use the lint task:

```bash
bundle exec rake lint
```

Auto-fix RuboCop violations where possible:

```bash
bundle exec rubocop -a
```

### Test Categories

- **Wire Tests** (`test/wire/`) - Integration tests that validate API endpoint functionality using WireMock
- **Custom Tests** (`test/custom.test.rb`) - Custom test cases for specific functionality

## Development Workflow

### Making Changes

1. Create a new branch for your changes
2. Make your modifications
3. Run tests to ensure nothing breaks: `bundle exec rake test`
4. Run linter to ensure code quality: `bundle exec rake lint`
5. Commit your changes with a descriptive message

### Code Style

This project follows Ruby community standards and uses RuboCop for enforcement. Key guidelines:

- Use 2 spaces for indentation (no tabs)
- Follow the [Ruby Style Guide](https://rubystyle.guide/)
- Keep lines under 120 characters where possible
- Use descriptive variable and method names
- Add comments for complex logic

### Running the SDK Locally

You can test the SDK locally using `bundle console` or by creating a test script:

```ruby
require_relative 'lib/payroc'

api_key = ENV['PAYROC_API_KEY']
client = Payroc::Client.new(
  base_url: Payroc::Environment::UAT,
  api_key: api_key
)

# Test your changes here
```

## Debugging

### Using Pry

The project includes Pry for debugging. Add breakpoints in your code:

```ruby
require 'pry'

def some_method
  binding.pry  # Execution will pause here
  # ... rest of code
end
```

### Viewing HTTP Requests

WebMock is configured to allow real HTTP requests in development. You can inspect requests by enabling logging or using tools like WireMock.

## Additional Resources

- [Ruby Documentation](https://ruby-doc.org/)
- [Minitest Documentation](https://github.com/minitest/minitest)
- [RuboCop Documentation](https://docs.rubocop.org/)
- [Bundler Documentation](https://bundler.io/)
