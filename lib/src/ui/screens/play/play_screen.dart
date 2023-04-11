import 'package:athlas/src/localization/string_hardcoded.dart';
import 'package:athlas/src/ui/screens/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlayScreen extends BaseStatefulScreen {
  PlayScreen({
    Key? key,
  }) : super(key: key, screenTitle: 'Play'.hardcoded);

  @override
  ConsumerState<PlayScreen> createState() => PlayScreenState();
}

class PlayScreenState extends BaseScreenState<PlayScreen> {
  @override
  Widget content(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Play Screen'.hardcoded,
                  style: Theme.of(context).textTheme.headlineMedium),
            ],
          ),
        )
      ],
    );
  }
}
