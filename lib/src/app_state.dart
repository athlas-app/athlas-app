import 'package:athlas/src/localization/string_hardcoded.dart';
import 'package:athlas/src/routing/app_router.dart';
import 'package:athlas/src/ui/common/navigation/navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    required List<NavigationBarItem> navigationBarItems,
  }) = _AppState;

  factory AppState.initial() => AppState(
        navigationBarItems: _navigationBarItems,
      );
}

final _navigationBarItems = [
  NavigationBarItem(
    icon: Icons.home,
    title: 'Home'.hardcoded,
    route: AppRoute.home,
  ),
  NavigationBarItem(
    icon: Icons.sports_tennis,
    title: 'Play'.hardcoded,
    route: AppRoute.play,
  ),
  NavigationBarItem(
    icon: Icons.group,
    title: 'Social'.hardcoded,
    route: AppRoute.social,
  ),
  NavigationBarItem(
    icon: Icons.settings,
    title: 'Profile'.hardcoded,
    route: AppRoute.profile,
  ),
];
