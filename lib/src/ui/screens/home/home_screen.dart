import 'package:athlas/src/localization/string_hardcoded.dart';
import 'package:athlas/src/ui/screens/base_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends BaseStatefulScreen {
  HomeScreen({
    Key? key,
  }) : super(key: key, screenTitle: 'Home'.hardcoded);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends BaseScreenState<HomeScreen> {
  @override
  Widget content(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Home Screen'.hardcoded,
                  style: Theme.of(context).textTheme.headlineMedium),
            ],
          ),
        )
      ],
    );
  }
}
