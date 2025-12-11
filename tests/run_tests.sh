#!/bin/bash

# Test runner script for WSL Monitor

set -e

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

echo "========================================"
echo "    WSL Monitor Test Suite"
echo "========================================"
echo ""

# Check if bats is installed
if ! command -v bats &> /dev/null; then
    echo "❌ BATS is not installed."
    echo "Please install it:"
    echo "  - Ubuntu/Debian: sudo apt-get install bats"
    echo "  - macOS: brew install bats-core"
    echo "  - Manual: https://github.com/bats-core/bats-core"
    exit 1
fi

echo "✓ BATS found: $(bats --version)"
echo ""

# Make sure the main script is executable
chmod +x "$PROJECT_ROOT/wsl_monitor.sh"

# Run the tests
echo "Running tests..."
echo ""

cd "$PROJECT_ROOT"
bats tests/test_wsl_monitor.bats

echo ""
echo "========================================"
echo "    All tests completed!"
echo "========================================"
