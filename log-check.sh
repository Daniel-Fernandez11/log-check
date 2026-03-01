#!/bin/bash

# LogCheck

# Functions

validate_arguments() {
    if [ "$#" -ne 1 ]; then
        echo "Usage: $0 log_file"
        exit 1
    fi
}

check_log_exists() {
    if [ ! -f "$1" ]; then
        echo "Error: log file does not exist"
        exit 1
    fi
}

check_for_errors() {
    if grep -q "ERROR" "$1"; then
        echo "Errors found in log file"
        exit 1
    else
        echo "No errors found in log file"
        exit 0
    fi
}

# Main
main() {
    validate_arguments "$@"
    check_log_exists "$1"
    check_for_errors "$1"
}

main "$@"
