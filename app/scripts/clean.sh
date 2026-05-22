#!/bin/bash

BOARD=$1
PROJECT_DIR=$2

BUILD_DIR="${PROJECT_DIR}/build-${BOARD}"
LINK_DIR="${PROJECT_DIR}/build"

echo "======================================"
echo "Cleaning build directory: ${BUILD_DIR}"
echo "======================================"

if [ -d "${BUILD_DIR}" ] || [ -d "${LINK_DIR}" ] || [ -f "${PROJECT_DIR}/compile_commands.json" ]; then
  rm -rf "${BUILD_DIR}"
  rm -f "${LINK_DIR}"
  rm -f "${PROJECT_DIR}/compile_commands.json"
  echo "Deleted ${BUILD_DIR}, ${LINK_DIR} and ${PROJECT_DIR}/compile_commands.json"
else
  echo "Nothing to clean"
fi
