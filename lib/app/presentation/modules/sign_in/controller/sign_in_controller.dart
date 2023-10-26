import 'package:flutter/foundation.dart';
import 'package:movies_flutter/app/presentation/modules/sign_in/controller/sign_in_state.dart';

class SignInController extends ChangeNotifier {
  SignInState _state = SignInState();
  bool _mounted = true;

  SignInState get state => _state;

  bool get mounted => _mounted;

  void onUsernameChanged(String text) {
    _state = _state.copyWith(
      username: text.trim().toLowerCase(),
    );
  }

  void onPasswordChanged(String text) {
    _state = state.copyWith(password: text.replaceAll('', ''));
  }

  void onFetchingChanged(bool value) {
    _state = state.copyWith(fetching: value);
    notifyListeners();
  }

  @override
  void dispose() {
    _mounted = false;
    super.dispose();
  }
}
