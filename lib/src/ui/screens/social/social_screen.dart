import 'package:athlas/src/app_controller.dart';
import 'package:athlas/src/app_state.dart';
import 'package:athlas/src/localization/string_hardcoded.dart';
import 'package:athlas/src/ui/screens/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SocialScreen extends BaseStatelessScreen {
  SocialScreen({Key? key})
      : super(
          key: key,
          screenTitle: 'Social'.hardcoded,
        );

  @override
  Widget content(
    BuildContext context,
    AsyncValue<AppState> appState,
    AppController appController,
  ) {
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Social Screen'.hardcoded,
                  style: Theme.of(context).textTheme.headlineMedium),
            ],
          ),
        )
      ],
    );
  }
}
