#!/usr/bin/env bash
set -euo pipefail

program=$1

expect_output() {
    local input=$1 expected=$2
    local output
    output=$(printf '%s\n' "$input" | "$program")
    if [[ $output != "$expected" ]]; then
        printf 'input %q: expected %q, got %q\n' "$input" "$expected" "$output" >&2
        exit 1
    fi
}

expect_failure() {
    local input=$1
    if printf '%s\n' "$input" | "$program" >/dev/null 2>/dev/null; then
        printf 'input %q unexpectedly succeeded\n' "$input" >&2
        exit 1
    fi
}

expect_output '0 0' 'cost=0.00'
expect_output '30 1' 'cost=0.00'
expect_output '31 0' 'cost=1.00'
expect_output '31 1' 'cost=0.80'
expect_output '90 0' 'cost=60.00'
expect_output '91 0' 'cost=62.00'
expect_failure '-1 0'
expect_failure '31 2'
expect_failure '31'
printf 'public tests passed\n'
