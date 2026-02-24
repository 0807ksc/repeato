#!/usr/bin/env bash
set -euo pipefail

if ! command -v flutter >/dev/null 2>&1; then
  echo "[error] flutter not found. Run ./scripts/bootstrap_flutter_macos.sh first."
  exit 1
fi

echo "== Flutter Version =="
flutter --version

echo ""
echo "== Flutter Doctor =="
flutter doctor -v

echo ""
echo "== Connected Devices =="
flutter devices || true
