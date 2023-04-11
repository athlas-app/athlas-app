import 'package:athlas/src/app_controller.dart';
import 'package:athlas/src/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseStatelessScreen extends ConsumerWidget {
  final String screenTitle;

  const BaseStatelessScreen({
    Key? key,
    required this.screenTitle,
  }) : super(key: key);

  Widget content(
    BuildContext context,
    AsyncValue<AppState> appState,
    AppController appController,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appControllerProvider);
    final appController = ref.read(appControllerProvider.notifier);

    return Scaffold(
      body: content(context, appState, appController),
    );
  }
}

abstract class BaseStatefulScreen extends ConsumerStatefulWidget {
  final String screenTitle;

  const BaseStatefulScreen({
    required Key? key,
    required this.screenTitle,
  }) : super(key: key);
}

abstract class BaseScreenState<T extends BaseStatefulScreen>
    extends ConsumerState<T> {
  late final appState = ref.watch(appControllerProvider);
  late final appController = ref.read(appControllerProvider.notifier);

  Widget content(
    BuildContext context,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: content(context),
    );
  }
}
