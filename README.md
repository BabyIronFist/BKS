# bks

记事本

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
lib/
│
├── main.dart
├── models/
│   └── todo_item.dart
├── screens/
│   ├── home_screen.dart
│   ├── user_screen.dart
├── widgets/
│   ├── todo_list_tile.dart
│   ├── bottom_nav_bar.dart
└── services/
    └── todo_service.dart
生成.g.dark
flutter packages pub run build_runner build
打包成apk（build/app/outputs/flutter-apk/）
flutter build apk --debug

flutter build apk --release --obfuscate --split-debug-info=build/app/outputs/flutter-apk/ --target-platform=android-arm,android-arm64,android-x64 --split-per-abi

flutter build apk --release --obfuscate --split-debug-info=build/app/outputs/flutter-apk/