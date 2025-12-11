#!/usr/bin/env bats

# Test suite for wsl_monitor.sh

setup() {
    # Get the containing directory of this script
    DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )"
    # Make the script executable
    chmod +x "$DIR/../wsl_monitor.sh"
    SCRIPT="$DIR/../wsl_monitor.sh"
}

@test "Script file exists" {
    [ -f "$SCRIPT" ]
}

@test "Script is executable" {
    [ -x "$SCRIPT" ]
}

@test "Script has valid bash syntax" {
    bash -n "$SCRIPT"
}

@test "Script has proper shebang" {
    head -n 1 "$SCRIPT" | grep -q "^#!/bin/bash"
}

@test "Script runs without errors" {
    run timeout 10 "$SCRIPT"
    # Exit code 0 or 124 (timeout) are acceptable
    [ "$status" -eq 0 ] || [ "$status" -eq 124 ]
}

@test "Script produces output" {
    run timeout 10 "$SCRIPT"
    [ -n "$output" ]
}

@test "Script output contains 'WSL SYSTEM DIAGNOSTIC'" {
    run timeout 10 "$SCRIPT"
    echo "$output" | grep -q "WSL SYSTEM DIAGNOSTIC"
}

@test "Script output contains 'System Info'" {
    run timeout 10 "$SCRIPT"
    echo "$output" | grep -q "System Info"
}

@test "Script output contains 'Kernel'" {
    run timeout 10 "$SCRIPT"
    echo "$output" | grep -q "Kernel"
}

@test "Script output contains 'Environment'" {
    run timeout 10 "$SCRIPT"
    echo "$output" | grep -q "Environment"
}

@test "Script output contains 'Uptime'" {
    run timeout 10 "$SCRIPT"
    echo "$output" | grep -q "Uptime"
}

@test "Script output contains 'Memory Status'" {
    run timeout 10 "$SCRIPT"
    echo "$output" | grep -q "Memory Status"
}

@test "Script output contains 'Disk Usage'" {
    run timeout 10 "$SCRIPT"
    echo "$output" | grep -q "Disk Usage"
}

@test "Script output contains 'Top Heavy Processes'" {
    run timeout 10 "$SCRIPT"
    echo "$output" | grep -q "Top Heavy Processes"
}

@test "Script defines color variables" {
    grep -q "RED=" "$SCRIPT"
    grep -q "GREEN=" "$SCRIPT"
    grep -q "CYAN=" "$SCRIPT"
    grep -q "GREY=" "$SCRIPT"
    grep -q "NC=" "$SCRIPT"
}

@test "Script uses uname command" {
    grep -q "uname" "$SCRIPT"
}

@test "Script uses free command" {
    grep -q "free" "$SCRIPT"
}

@test "Script uses df command" {
    grep -q "df" "$SCRIPT"
}

@test "Script uses ps command" {
    grep -q "ps" "$SCRIPT"
}

@test "Script uses uptime command" {
    grep -q "uptime" "$SCRIPT"
}

@test "Script checks for WSL or Linux environment" {
    grep -q "microsoft.*proc.*version" "$SCRIPT" || grep -q "WSL\|Native Linux" "$SCRIPT"
}

@test "Script calculates memory percentage" {
    grep -q "PERCENT" "$SCRIPT"
}

@test "Script shows disk usage information" {
    grep -q "df -h" "$SCRIPT"
}

@test "Script lists processes" {
    grep -q "ps -eo" "$SCRIPT" || grep -q "ps.*pid" "$SCRIPT"
}
