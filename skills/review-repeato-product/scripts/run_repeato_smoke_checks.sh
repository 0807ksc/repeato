#!/usr/bin/env bash
set -euo pipefail

APP_DIR="${1:-app}"

cd "$APP_DIR"

flutter pub get
flutter analyze
flutter test
