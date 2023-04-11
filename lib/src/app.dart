import 'package:athlas/app_config.dart';
import 'package:athlas/src/routing/app_router.dart';
import 'package:athlas/src/ui/common/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainApp extends ConsumerWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerDelegate: goRouter.routerDelegate,
      routeInformationParser: goRouter.routeInformationParser,
      routeInformationProvider: goRouter.routeInformationProvider,
      debugShowCheckedModeBanner: true,
      restorationScopeId: 'app',
      title: AppConfig.of(context).appTitle,
      color: Colors.grey,
      theme: lightAppTheme,
    );
  }
}
