#!/usr/bin/env bash
set -euo pipefail

# Usage: ./scripts/install_repeato_tab_icons.sh [app_dir]
APP_DIR="${1:-app}"
SRC_DIR="doc/work/assets/icons/repeato-tab-icons-v1"
DEST_DIR="$APP_DIR/assets/icons/tab"

if [[ ! -d "$APP_DIR" ]]; then
  echo "[error] app dir not found: $APP_DIR"
  exit 1
fi

mkdir -p "$DEST_DIR"
cp "$SRC_DIR"/*.svg "$DEST_DIR"/

echo "[done] Installed tab icons to $DEST_DIR"
echo "[next] Ensure pubspec.yaml includes: assets/icons/tab/"
