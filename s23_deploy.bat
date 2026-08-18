#!/bin/bash
set -e
echo "[●] RUNNING SECURE S23 TACTICAL INSTALLATION ENGINE..."

# Clean old database remnants and application packages
adb uninstall com.scannerx.pro.tactical || true

# Extract specific device splits using the native java environment
java -jar bundletool.jar build-apks \
  --bundle=app/build/outputs/bundle/tacticalRelease/app-tactical-release.aab \
  --output=app/build/outputs/bundle/tacticalRelease/s23_split.apks \
  --mode=default \
  --device-spec=s23_profile.json

# Push clean system arrays straight into device storage partitions
java -jar bundletool.jar install-apks --apks=app/build/outputs/bundle/tacticalRelease/s23_split.apks

echo "[●] CLEAN FRESH INSTALL SUCCESSFUL."
