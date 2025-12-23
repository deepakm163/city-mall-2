#!/bin/bash
set -e

# 1. Install Dependencies
echo "Installing dependencies..."
sudo apt-get update
sudo apt-get install -y curl unzip git openjdk-17-jdk

# 2. Install Flutter SDK
echo "Installing Flutter SDK..."
FLUTTER_VERSION="3.22.1"
FLUTTER_CHANNEL="stable"
FLUTTER_DIR="$HOME/flutter"

if [ ! -d "$FLUTTER_DIR" ]; then
  git clone https://github.com/flutter/flutter.git -b $FLUTTER_CHANNEL --depth 1 "$FLUTTER_DIR"
fi

export PATH="$FLUTTER_DIR/bin:$PATH"

flutter --version
flutter precache

# 3. Install Android SDK Command-Line Tools
echo "Installing Android SDK Command-Line Tools..."
SDK_DIR="$HOME/Android/sdk"
mkdir -p "$SDK_DIR"

# Download the latest command-line tools
# Note: You might need to update this URL if it becomes outdated.
# Check the official Android Studio download page for the latest version.
SDK_TOOLS_URL="https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip"
SDK_TOOLS_ZIP="sdk-tools.zip"
curl -o "$SDK_TOOLS_ZIP" "$SDK_TOOLS_URL"
unzip -q "$SDK_TOOLS_ZIP" -d "$SDK_DIR/cmdline-tools"
rm "$SDK_TOOLS_ZIP"

# The unzipped folder is named 'cmdline-tools', we want to rename it to 'latest'
mv "$SDK_DIR/cmdline-tools/cmdline-tools" "$SDK_DIR/cmdline-tools/latest"

# 4. Set Android SDK Environment Variables
export ANDROID_SDK_ROOT="$SDK_DIR"
export PATH="$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$PATH"
export PATH="$ANDROID_SDK_ROOT/platform-tools:$PATH"
export PATH="$ANDROID_SDK_ROOT/emulator:$PATH"


# 5. Accept SDK Licenses
echo "Accepting Android SDK licenses..."
yes | sdkmanager --licenses > /dev/null

# 6. Install Platform-Tools, Platforms, and Build-Tools
echo "Installing Android SDK components..."
sdkmanager "platform-tools" "platforms;android-34" "build-tools;34.0.0"

# 7. Run Flutter Doctor to verify
echo "Running flutter doctor..."
flutter doctor

echo "Setup complete!"
