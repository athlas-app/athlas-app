import 'package:athlas/src/constants/app_sizes.dart';
import 'package:athlas/src/ui/common/ds/buttons/primary_button.dart';
import 'package:athlas/src/ui/common/ds/buttons/text_button.dart';
import 'package:athlas/src/ui/common/ds/responsive/responsive_scrollable_card.dart';
import 'package:athlas/src/ui/screens/auth/auth_controller.dart';
import 'package:athlas/src/ui/screens/auth/auth_form_type.dart';
import 'package:athlas/src/localization/string_hardcoded.dart';
import 'package:athlas/src/ui/screens/auth/auth_validators.dart';
import 'package:athlas/src/ui/screens/base_screen.dart';
import 'package:athlas/src/utils/async_value_ui.dart';
import 'package:athlas/src/utils/string_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthScreen extends BaseStatefulScreen {
  const AuthScreen({
    Key? key,
    this.onSignedIn,
    required this.formType,
  }) : super(key: key, screenTitle: 'Auth Screen');

  final AuthFormType formType;
  final VoidCallback? onSignedIn;

  // * Keys for testing using find.byKey()
  static const emailKey = Key('email');
  static const passwordKey = Key('password');

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => AuthScreenState();
}

class AuthScreenState extends BaseScreenState<AuthScreen> with AuthValidators {
  final _formKey = GlobalKey<FormState>();
  final _node = FocusScopeNode();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String get email => _emailController.text;
  String get password => _passwordController.text;

  // local variable used to apply AutovalidateMode.onUserInteraction and show
  // error hints only when the form has been submitted
  var _submitted = false;

  late var _formType = widget.formType;

  @override
  void dispose() {
    // * TextEditingControllers should be always disposed
    _node.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    setState(() => _submitted = true);
    // only submit the form if validation passes
    if (_formKey.currentState!.validate()) {
      final controller = ref.read(authControllerProvider.notifier);
      final success = await controller.submit(
        email: email,
        password: password,
        formType: _formType,
      );
      if (success) {
        widget.onSignedIn?.call();
      }
    }
  }

  void _emailEditingComplete() {
    if (canSubmitEmail(email)) {
      _node.nextFocus();
    }
  }

  void _passwordEditingComplete() {
    if (!canSubmitEmail(email)) {
      _node.previousFocus();
      return;
    }
    _submit();
  }

  void _updateFormType(AuthFormType formType) {
    // * Toggle between register and sign in form
    setState(() => _formType = _formType.secondaryActionFormType);
    // * Clear the password field when doing so
    _passwordController.clear();
  }

  @override
  Widget content(BuildContext context) {
    ref.listen<AsyncValue>(
      authControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    final state = ref.watch(authControllerProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Sign In'.hardcoded)),
      body: ResponsiveScrollableCard(
        child: FocusScope(
          node: _node,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                gapH8,
                // Email field
                TextFormField(
                  key: AuthScreen.emailKey,
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email'.hardcoded,
                    hintText: 'test@test.com'.hardcoded,
                    enabled: !state.isLoading,
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (email) =>
                      !_submitted ? null : emailErrorText(email ?? ''),
                  autocorrect: false,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  keyboardAppearance: Brightness.light,
                  onEditingComplete: () => _emailEditingComplete(),
                  inputFormatters: <TextInputFormatter>[
                    ValidatorInputFormatter(
                        editingValidator: EmailEditingRegexValidator()),
                  ],
                ),
                gapH8,
                // Password field
                TextFormField(
                  key: AuthScreen.passwordKey,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: _formType.passwordLabelText,
                    enabled: !state.isLoading,
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (password) => !_submitted
                      ? null
                      : passwordErrorText(password ?? '', _formType),
                  obscureText: true,
                  autocorrect: false,
                  textInputAction: TextInputAction.done,
                  keyboardAppearance: Brightness.light,
                  onEditingComplete: () => _passwordEditingComplete(),
                ),
                gapH8,
                PrimaryButtonUI(
                  text: _formType.primaryButtonText,
                  isLoading: state.isLoading,
                  onPressed: state.isLoading ? null : () => _submit(),
                ),
                gapH8,
                TextButtonUI(
                  text: _formType.secondaryButtonText,
                  onPressed: state.isLoading
                      ? null
                      : () =>
                          _updateFormType(_formType.secondaryActionFormType),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
