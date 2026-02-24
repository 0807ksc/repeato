#!/usr/bin/env bash
set -euo pipefail

# macOS local bootstrap for Flutter + Android tooling.
# Usage: ./scripts/bootstrap_flutter_macos.sh

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "[error] This script supports macOS only."
  exit 1
fi

if ! command -v brew >/dev/null 2>&1; then
  echo "[error] Homebrew is required. Install from https://brew.sh"
  exit 1
fi

echo "[step] Installing base dependencies..."
brew install --cask flutter
brew install --cask android-platform-tools
brew install --cask temurin@17
brew install cocoapods

echo "[step] Ensuring Android commandline-tools path in shell profile..."
ANDROID_ROOT_DEFAULT="$HOME/Library/Android/sdk"
PROFILE_FILE="$HOME/.zshrc"
if [[ -n "${BASH_VERSION:-}" ]]; then
  PROFILE_FILE="$HOME/.bashrc"
fi

if ! grep -q "ANDROID_SDK_ROOT" "$PROFILE_FILE" 2>/dev/null; then
  {
    echo ""
    echo "# Android SDK"
    echo "export ANDROID_SDK_ROOT=\"$ANDROID_ROOT_DEFAULT\""
    echo "export PATH=\"\$PATH:\$ANDROID_SDK_ROOT/platform-tools:\$ANDROID_SDK_ROOT/emulator:\$ANDROID_SDK_ROOT/cmdline-tools/latest/bin\""
  } >> "$PROFILE_FILE"
  echo "[info] Added Android SDK env to $PROFILE_FILE"
fi

echo "[step] Running flutter precache and doctor..."
flutter --version
flutter precache
flutter doctor

echo ""
echo "[next] Manual steps still required:"
echo "1) Open Android Studio once and install: Android SDK, SDK Command-line Tools, Android Emulator"
echo "2) In Android Studio > Device Manager, create at least one Android Virtual Device"
echo "3) Run: flutter doctor --android-licenses"
echo "4) (iOS) Install Xcode from App Store, then run: sudo xcode-select -s /Applications/Xcode.app/Contents/Developer"
echo ""
echo "[done] Bootstrap finished. Re-open shell or run: source $PROFILE_FILE"
