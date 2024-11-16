# myapp

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## How to Flutter (by @ryangst)

### 1. Install Flutter

```bash
asdf plugin add flutter
asdf install flutter latest
```

### 2. Create a new Flutter project

```bash
flutter create myapp
cd myapp
```

### 3. Debug the hell of JDK version

Install JDK 17 (or whatever version is required by Flutter)

```bash
asdf plugin add java
asdf install java adoptopenjdk-17.0.0+12
```

```bash
flutter config --jdk-dir $WHERE_THE_FUCK_IS_YOUR_JDK
```

```bash
flutter run
```
