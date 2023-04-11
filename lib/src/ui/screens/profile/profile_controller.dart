import 'package:athlas/src/data/auth/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_controller.g.dart';

@Riverpod(keepAlive: true)
class ProfileController extends _$ProfileController {
  late final AuthRepository authRepository = ref.read(authRepositoryProvider);

  @override
  FutureOr<void> build() {
    // noop
  }

  Future<void> signOut() async {
    state = const AsyncLoading();
    await authRepository.signOut();
    state = const AsyncData(null);
  }
}
