@echo off
echo Building APK for Threads App...
flutter build apk --release
echo APK built successfully!
echo APK location: build\app\outputs\flutter-apk\app-release.apk
pause