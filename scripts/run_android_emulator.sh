#!/usr/bin/env bash
set -euo pipefail

# Usage: ./scripts/run_android_emulator.sh [app_dir] [avd_name]
APP_DIR="${1:-app}"
AVD_NAME="${2:-}"

if ! command -v flutter >/dev/null 2>&1; then
  echo "[error] flutter not found."
  exit 1
fi

if [[ ! -d "$APP_DIR" ]]; then
  echo "[error] app dir not found: $APP_DIR"
  exit 1
fi

if [[ -z "$AVD_NAME" ]]; then
  if command -v emulator >/dev/null 2>&1; then
    AVD_NAME="$(emulator -list-avds | head -n 1)"
  fi
fi

if [[ -z "$AVD_NAME" ]]; then
  echo "[error] No AVD found. Create one in Android Studio > Device Manager."
  exit 1
fi

echo "[step] Starting emulator: $AVD_NAME"
nohup emulator -avd "$AVD_NAME" >/tmp/repeato-android-emulator.log 2>&1 &

if command -v adb >/dev/null 2>&1; then
  echo "[step] Waiting for Android emulator to boot..."
  adb wait-for-device
fi

cd "$APP_DIR"
flutter run -d android
