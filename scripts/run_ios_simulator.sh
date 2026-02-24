#!/usr/bin/env bash
set -euo pipefail

# Usage: ./scripts/run_ios_simulator.sh [app_dir] [simulator_name]
APP_DIR="${1:-app}"
SIM_NAME="${2:-iPhone 16}"

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "[error] iOS simulator requires macOS."
  exit 1
fi

if ! command -v flutter >/dev/null 2>&1; then
  echo "[error] flutter not found."
  exit 1
fi

if ! command -v xcrun >/dev/null 2>&1; then
  echo "[error] xcrun not found. Install Xcode."
  exit 1
fi

if [[ ! -d "$APP_DIR" ]]; then
  echo "[error] app dir not found: $APP_DIR"
  exit 1
fi

# Check if CoreSimulator service is available.
if ! xcrun simctl list devices >/tmp/repeato-simctl-check.log 2>&1; then
  echo "[error] CoreSimulator is not available."
  echo "[hint] Run the following once, then retry:"
  echo "  sudo xcodebuild -runFirstLaunch"
  echo "  open -a Xcode  # wait until initial setup finishes"
  echo "  open -a Simulator"
  echo ""
  echo "[detail] recent simctl output:"
  sed -n '1,25p' /tmp/repeato-simctl-check.log
  exit 1
fi

DEVICE_UDID="$(xcrun simctl list devices available | awk -F '[()]' -v name="$SIM_NAME" '$0 ~ name {print $2; exit}')"
if [[ -z "$DEVICE_UDID" ]]; then
  echo "[warn] Simulator '$SIM_NAME' not found. Using first available iPhone simulator."
  DEVICE_UDID="$(xcrun simctl list devices available | awk -F '[()]' '/iPhone/ {print $2; exit}')"
fi

if [[ -z "$DEVICE_UDID" ]]; then
  echo "[error] No available iOS simulator found."
  echo "[hint] Create one in Xcode:"
  echo "  1) Open Xcode > Settings > Platforms and ensure at least one iOS runtime is installed"
  echo "  2) Open Xcode > Window > Devices and Simulators > Simulators > +"
  echo "  3) Create an iPhone simulator (e.g., iPhone 16)"
  exit 1
fi

xcrun simctl boot "$DEVICE_UDID" >/dev/null 2>&1 || true
open -a Simulator >/dev/null 2>&1 || true

cd "$APP_DIR"
flutter run -d "$DEVICE_UDID"
