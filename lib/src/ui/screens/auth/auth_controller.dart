import 'package:athlas/src/data/auth/auth_repository.dart';
import 'package:athlas/src/ui/screens/auth/auth_form_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<void> build() {
    // noop
  }

  Future<bool> submit({
    required String email,
    required String password,
    required AuthFormType formType,
  }) async {
    state = const AsyncValue.loading();
    state =
        await AsyncValue.guard(() => _authenticate(email, password, formType));
    return state.hasError == false;
  }

  Future<void> _authenticate(
    String email,
    String password,
    AuthFormType formType,
  ) {
    final authRepository = ref.read(authRepositoryProvider);
    switch (formType) {
      case AuthFormType.signIn:
        return authRepository.emailSignIn(email, password);
      case AuthFormType.register:
        return authRepository.emailSignUp(email, password);
    }
  }
}
