import 'package:athlas/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';

part 'navigation_bar_item.freezed.dart';

class NavigationBarItemUI extends ConsumerWidget {
  final NavigationBarItem item;
  const NavigationBarItemUI({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        IconButton(
          onPressed: () => context.goNamed(item.route.name),
          icon: Icon(item.icon),
          color: Colors.white,
        ),
        Text(
          item.title,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}

@freezed
class NavigationBarItem with _$NavigationBarItem {
  const factory NavigationBarItem({
    required String title,
    required IconData icon,
    required AppRoute route,
  }) = _NavigationBarItem;
}
