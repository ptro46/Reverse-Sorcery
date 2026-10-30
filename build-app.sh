#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")"
export CLANG_MODULE_CACHE_PATH="$PWD/build/ModuleCache"
export SWIFTPM_MODULECACHE_OVERRIDE="$PWD/build/ModuleCache"
swift build --disable-sandbox -c release --scratch-path build/swift
APP="${SORCERY_APP_PATH:-$PWD/build/Sorcery HD.app}"
mkdir -p "$APP/Contents/MacOS" "$APP/Contents/Resources/Game"
cp build/swift/release/SorceryMac "$APP/Contents/MacOS/Sorcery"
cp -R Sources/SorceryMac/Resources/. "$APP/Contents/Resources/Game/"
cat > "$APP/Contents/Info.plist" <<'PLIST'
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0"><dict>
<key>CFBundleExecutable</key><string>Sorcery</string>
<key>CFBundleIdentifier</key><string>fr.ptro.sorcery.hd</string>
<key>CFBundleName</key><string>Sorcery HD</string>
<key>CFBundleDisplayName</key><string>Sorcery HD</string>
<key>CFBundleVersion</key><string>3</string>
<key>CFBundleShortVersionString</key><string>0.2.1</string>
<key>CFBundlePackageType</key><string>APPL</string>
<key>LSMinimumSystemVersion</key><string>13.0</string>
<key>NSHighResolutionCapable</key><true/>
<key>NSHumanReadableCopyright</key><string>Native reconstruction. Original game assets remain with their respective authors.</string>
</dict></plist>
PLIST
# Declare framework controller support, including devices connected after launch.
/usr/libexec/PlistBuddy -c 'Add :GCSupportedGameControllers array' "$APP/Contents/Info.plist"
/usr/libexec/PlistBuddy -c 'Add :GCSupportedGameControllers:0 dict' "$APP/Contents/Info.plist"
/usr/libexec/PlistBuddy -c 'Add :GCSupportedGameControllers:0:ProfileName string ExtendedGamepad' "$APP/Contents/Info.plist"
codesign --force --deep --sign - "$APP"
printf 'Application : %s\n' "$APP"
