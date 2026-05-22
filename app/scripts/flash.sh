#!/bin/bash

BOARD=$1
PROJECT_DIR=$2

WEST="${HOME}/zephyr-course/.venv/bin/west"

BUILD_DIR="${PROJECT_DIR}/build-${BOARD}"

if [ ! -d "${BUILD_DIR}" ]; then
  echo "Build directory not found. Running build first..."
  "${PROJECT_DIR}/scripts/build.sh" "${BOARD}" "${PROJECT_DIR}" incremental
fi

detect_port() {
  for dev in /dev/ttyACM*; do
    if udevadm info -q property -n "$dev" | grep -q "QinHeng Electronics"; then
      echo "$dev"
      return
    fi
  done
}

case ${BOARD} in
  nucleo_*)
    echo "Flashing STM32..."
    $WEST flash -d "${BUILD_DIR}"
    ;;
  esp32)
    PORT=$(detect_port)

    if [ -z "${PORT}" ]; then
      echo "ESP32 not found!"
      exit 1
    fi

    echo "Using ESP32 port: ${PORT}"

    ${WEST} flash -d "${BUILD_DIR}" --esp-device "${PORT}"
    ;;
  *)
    echo "Unknown board: ${BOARD}"
    exit 2
    ;;
esac
