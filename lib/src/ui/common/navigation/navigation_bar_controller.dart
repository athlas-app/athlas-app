import 'package:athlas/src/data/play/play_repository.dart';
import 'package:athlas/src/localization/string_hardcoded.dart';
import 'package:athlas/src/ui/common/ds/alerts/alert_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigation_bar_controller.g.dart';

@Riverpod(keepAlive: true)
class NavigationBarController extends _$NavigationBarController {
  late final GameRepository matchRepository = ref.read(matchRepositoryProvider);

  @override
  FutureOr<void> build() {
    // noop
  }

  Future<void> createMatch(BuildContext context) async {
    state = const AsyncLoading();
    var result = await matchRepository.createGame();
    if (result != null) {
      if (context.mounted) {
        showAlertDialog(context: context, title: 'It worked!'.hardcoded);
      }
    } else {
      if (context.mounted) {
        showAlertDialog(context: context, title: 'Did not work'.hardcoded);
      }
    }
    state = const AsyncData(null);
  }
}
