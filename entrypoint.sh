#!/bin/bash
set -e

# If no arguments provided, show help
if [ $# -eq 0 ]; then
    exec songrec --help
fi

# Execute songrec with all provided arguments
exec songrec "$@"