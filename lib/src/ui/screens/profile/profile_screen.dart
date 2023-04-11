import 'package:athlas/src/constants/app_sizes.dart';
import 'package:athlas/src/localization/string_hardcoded.dart';
import 'package:athlas/src/ui/common/ds/buttons/primary_button.dart';
import 'package:athlas/src/ui/screens/base_screen.dart';
import 'package:athlas/src/ui/screens/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends BaseStatefulScreen {
  ProfileScreen({
    Key? key,
  }) : super(key: key, screenTitle: 'Profile'.hardcoded);

  @override
  ConsumerState<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends BaseScreenState<ProfileScreen> {
  @override
  Widget content(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Profile Screen'.hardcoded,
                  style: Theme.of(context).textTheme.headlineMedium),
              gapH12,
              PrimaryButtonUI(
                onPressed: () =>
                    ref.read(profileControllerProvider.notifier).signOut(),
                text: 'Sign out'.hardcoded,
              )
            ],
          ),
        )
      ],
    );
  }
}
