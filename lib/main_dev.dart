import 'dart:async';

import 'package:athlas/app_config.dart';
import 'package:athlas/firebase/dev/firebase_options.dart';
import 'package:athlas/src/app.dart';
import 'package:athlas/src/localization/string_hardcoded.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  // * For more info on error handling, see:
  // * https://docs.flutter.dev/testing/errors
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    // * Firebase Initialization
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // Uncomment this line to use the authentication emulator
    // await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

    // * Entry point of the app
    const configuredApp = AppConfig(
      child: ProviderScope(child: MainApp()),
      environment: Environment.dev,
      appTitle: 'Athlas (dev)',
    );
    runApp(configuredApp);

    // * This code will present some error UI if any uncaught exception happens
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
    };
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('An error occurred'.hardcoded),
        ),
        body: Center(child: Text(details.toString())),
      );
    };
  }, (Object error, StackTrace stack) {
    // * Log any errors to console
    debugPrint(error.toString());
  });
}
