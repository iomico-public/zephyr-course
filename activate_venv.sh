#!/usr/bin/env bash
# Usage: source ./activate_venv.sh

# 1. REPO_ROOT = directory containing this script
if [ -z "${REPO_ROOT:-}" ]; then
    _script="${BASH_SOURCE[0]:-$0}"
    REPO_ROOT="$(cd "$(dirname "$_script")" && pwd)"
    unset _script
fi
export REPO_ROOT

# 2. Locations (override by exporting before sourcing)
ZEPHYR_WORKSPACE="${ZEPHYR_WORKSPACE:-$HOME/Girish/GITHUB/Zephyr_Workspace/zephyrproject}"
ZEPHYR_VENV="${ZEPHYR_VENV:-$ZEPHYR_WORKSPACE/.venv}"
BUILD_TOOLS="$REPO_ROOT/tools/build_tools"
BUNDLED_PYTHON="$BUILD_TOOLS/Python312-linux/python/bin/python3.12"

# 3. Leave any active venv first (avoids stacked prompts like ((.venv) ))
type deactivate >/dev/null 2>&1 && deactivate

echo "==================================================="
echo "Repo Root : $REPO_ROOT"
echo "Build Tools : $BUILD_TOOLS"
echo "Workspace : $ZEPHYR_WORKSPACE"
echo "Venv      : $ZEPHYR_VENV"
echo "==================================================="

# 4. Prepend local build tools to PATH (only if they exist, no duplicates)
_path_prepend() {
    case ":$PATH:" in
        *":$1:"*) ;;
        *) export PATH="$1:$PATH" ;;
    esac
}

for d in \
    "$BUILD_TOOLS/CMake-linux/bin" \
    "$BUILD_TOOLS/ninja-linux"
do
    if [ -d "$d" ]; then
        _path_prepend "$d"
    else
        echo "[WARN] Missing tool dir: $d" >&2
    fi
done
unset -f _path_prepend

# 5. Activate the venv
if [ -f "$ZEPHYR_VENV/bin/activate" ]; then
    # shellcheck disable=SC1091
    . "$ZEPHYR_VENV/bin/activate"
else
    echo "[ERROR] Virtual environment not found at: $ZEPHYR_VENV" >&2
    echo "Create it with: \"$BUNDLED_PYTHON\" -m venv \"$ZEPHYR_VENV\"" >&2
    return 1 2>/dev/null || exit 1
fi

# 6. Let west find the workspace from any directory (e.g. this course repo)
if [ -d "$ZEPHYR_WORKSPACE/zephyr" ]; then
    export ZEPHYR_BASE="$ZEPHYR_WORKSPACE/zephyr"
else
    echo "[WARN] Zephyr not found at: $ZEPHYR_WORKSPACE/zephyr" >&2
fi