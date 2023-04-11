# athlas

Flutter project for the Athlas App

## Getting Started

### Installing Flutter

Before running the project, you must first install the Flutter SDK. To do so, visit the [Flutter Getting Started](https://docs.flutter.dev/get-started/install) page and download the correct version for your operating system.

**Note:** In order to build and create the iOS version of the application, you must be on a macOS device.

### Installing VSCode

VSCode is the recommended code editor for this project, and any launch [configs](#environment-configurations), utilities, and [tasks](#vscode-tasks) will be created with VSCode in mind. To download, please visit the [Visual Studio Code website](https://code.visualstudio.com/).

### Project Installation

In order to deploy a working version of the app, you must first clone the repository locally using:

```bash
git clone git@github.com:ProTimmy/athlas.git athlas
```

After cloning, navigate inside the project folder and run the following commands:

```bash
flutter pub get
doppler run --mount .env -- flutter pub run build_runner build --delete-conflicting-outputs
```

This will get all of the packages required to run the project, as well as create all of the various generated files and fetch the app secrets from Doppler.

## File Generation

## Environment Configurations

## VSCode Tasks

| Name               | Command                                                                                     | Description |
| ------------------ | ------------------------------------------------------------------------------------------- | ----------- |
| build_runner-build | doppler run --mount .env -- flutter pub run build_runner build --delete-conflicting-outputs | Title       |
