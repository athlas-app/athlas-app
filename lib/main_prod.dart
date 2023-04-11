import 'dart:async';

import 'package:athlas/app_config.dart';
import 'package:athlas/firebase/prod/firebase_options.dart';
import 'package:athlas/src/app.dart';
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

    // * Entry point of the app
    const configuredApp = AppConfig(
      child: ProviderScope(child: MainApp()),
      environment: Environment.prod,
      appTitle: 'Athlas',
    );
    runApp(configuredApp);
  }, (Object error, StackTrace stack) {
    // * Log any errors to console
    debugPrint(error.toString());
  });
}
