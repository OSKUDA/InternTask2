import 'package:flutter/foundation.dart';

enum ApplicationLoginState {
  loggedOut,
  loggedIn,
  signUp,
  login,
}

class AuthenticationState extends ChangeNotifier {
  ApplicationLoginState _loginState = ApplicationLoginState.loggedOut;

  void updateLoginState(ApplicationLoginState newApplicationLoginState) {
    _loginState = newApplicationLoginState;
    notifyListeners();
  }

  ApplicationLoginState get getCurrentLoginState => _loginState;
}
