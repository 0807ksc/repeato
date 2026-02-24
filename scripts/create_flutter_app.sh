#!/usr/bin/env bash
set -euo pipefail

# Usage: ./scripts/create_flutter_app.sh [app_dir]
APP_DIR="${1:-app}"

if ! command -v flutter >/dev/null 2>&1; then
  echo "[error] flutter not found. Run ./scripts/bootstrap_flutter_macos.sh first."
  exit 1
fi

if [[ -d "$APP_DIR" ]]; then
  echo "[skip] $APP_DIR already exists."
else
  flutter create "$APP_DIR"
  echo "[done] Created Flutter app at $APP_DIR"
fi

cd "$APP_DIR"
flutter pub get

cat <<MSG
[next]
- iOS run: ../scripts/run_ios_simulator.sh $APP_DIR
- Android run: ../scripts/run_android_emulator.sh $APP_DIR
MSG
