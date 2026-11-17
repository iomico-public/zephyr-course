#!/usr/bin/env bash

# Deactivate the virtual environment

# echo "$REPO_ROOT/tools/build_tools/"

# If 'deactivate' function is already available in the shell session:
if command -v deactivate &> /dev/null; then
    deactivate
else
    # Otherwise, source the deactivate script directly
    DEACTIVATE_SCRIPT="$REPO_ROOT/tools/build_tools/Python312/.venv/bin/deactivate"
    if [ -f "$DEACTIVATE_SCRIPT" ]; then
        source "$DEACTIVATE_SCRIPT"
    fi
fi