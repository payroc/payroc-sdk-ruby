#!/bin/bash
# Setup VS Code Extensions for Payroc Ruby SDK Development (macOS/Linux)
# This script installs the recommended extensions for developing the Payroc Ruby SDK

echo "Installing VS Code extensions for Payroc Ruby SDK development..."

# Check if code command is available
if ! command -v code &> /dev/null; then
    echo "Error: VS Code command 'code' not found in PATH."
    echo "Please ensure VS Code is installed and the 'code' command is available."
    echo "You can add it to PATH by opening VS Code and running 'Shell Command: Install code command in PATH' from the command palette."
    exit 1
fi

# Install Ruby extension
echo "Installing Ruby extension..."
code --install-extension rebornix.ruby --force

# Install Ruby LSP extension
echo "Installing Ruby LSP..."
code --install-extension Shopify.ruby-lsp --force

# Install Ruby Solargraph (alternative language server)
echo "Installing Ruby Solargraph..."
code --install-extension castwide.solargraph --force

# Install RuboCop extension
echo "Installing RuboCop extension..."
code --install-extension misogi.ruby-rubocop --force

echo ""
echo "✓ Extensions installed successfully!"
echo ""
echo "Next steps:"
echo "1. Reload VS Code (Ctrl+R or Cmd+Shift+P > Reload Window)"
echo "2. Install required gems: bundle install"
echo "3. Run tests: bundle exec rake test"
echo ""
echo "For more information, see CONTRIBUTING.md"
