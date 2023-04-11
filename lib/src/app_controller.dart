import 'package:athlas/src/app_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_controller.g.dart';

@Riverpod(keepAlive: true)
class AppController extends _$AppController {
  @override
  FutureOr<AppState> build() {
    return AppState.initial();
  }
}
