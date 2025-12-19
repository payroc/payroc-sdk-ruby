# Setup VS Code Extensions for Payroc Ruby SDK Development (Windows PowerShell)
# This script installs the recommended extensions for developing the Payroc Ruby SDK

Write-Host "Installing VS Code extensions for Payroc Ruby SDK development..." -ForegroundColor Green

# Check if code command is available
$codeExists = Get-Command code -ErrorAction SilentlyContinue
if (-not $codeExists) {
    Write-Host "Error: VS Code command 'code' not found in PATH." -ForegroundColor Red
    Write-Host "Please ensure VS Code is installed and the 'code' command is available." -ForegroundColor Yellow
    Write-Host "You can add it to PATH by opening VS Code and running 'Shell Command: Install code command in PATH' from the command palette." -ForegroundColor Yellow
    exit 1
}

# Install Ruby extension
Write-Host "Installing Ruby extension..." -ForegroundColor Cyan
code --install-extension rebornix.ruby --force
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Ruby extension installed" -ForegroundColor Green
} else {
    Write-Host "✗ Failed to install Ruby extension" -ForegroundColor Red
}

# Install Ruby LSP extension
Write-Host "Installing Ruby LSP..." -ForegroundColor Cyan
code --install-extension Shopify.ruby-lsp --force
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Ruby LSP installed" -ForegroundColor Green
} else {
    Write-Host "✗ Failed to install Ruby LSP" -ForegroundColor Red
}

# Install Ruby Solargraph (alternative language server)
Write-Host "Installing Ruby Solargraph..." -ForegroundColor Cyan
code --install-extension castwide.solargraph --force
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ Ruby Solargraph installed" -ForegroundColor Green
} else {
    Write-Host "✗ Failed to install Ruby Solargraph" -ForegroundColor Red
}

# Install RuboCop extension
Write-Host "Installing RuboCop extension..." -ForegroundColor Cyan
code --install-extension misogi.ruby-rubocop --force
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ RuboCop extension installed" -ForegroundColor Green
} else {
    Write-Host "✗ Failed to install RuboCop extension" -ForegroundColor Red
}

Write-Host ""
Write-Host "Extensions installation complete!" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Reload VS Code (Ctrl+Shift+P > Reload Window)" -ForegroundColor White
Write-Host "2. Install required gems: bundle install" -ForegroundColor White
Write-Host "3. Run tests: bundle exec rake test" -ForegroundColor White
Write-Host ""
Write-Host "For more information, see CONTRIBUTING.md" -ForegroundColor White
