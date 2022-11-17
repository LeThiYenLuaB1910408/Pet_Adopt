// import 'package:pet_adopt/models/accounts_model.dart';

// class AuthManager {
//   final List<Accounts> _accounts = [
//     Accounts(username: "quoctrang", password: "123456"),
//     Accounts(username: "quoctrang", password: "123456"),
//     Accounts(username: "quoctrang", password: "123456"),
//   ];
//   List<Accounts> get accounts {
//     return _accounts;
//   }

//   Accounts? findAccount(Accounts account) {
//     var result = _accounts.firstWhere(
//         (props) => props.username == account.username,
//         orElse: () => Accounts(username: '', password: ''));
//     if (result.password == account.password) {
//       return result;
//     }
//     return null;
//   }

//   bool addAccount(Accounts account) {
//     var result = _accounts.firstWhere(
//         (props) => props.username == account.username,
//         orElse: () => Accounts(username: '', password: ''));
//     if (result.username == '') {
//       return true;
//     } else {
//       return false;
//     }
//   }
// }
import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../models/auth_token.dart';
import '../../services/auth_service.dart';

class AuthManager with ChangeNotifier {
  AuthToken? _authToken;
  Timer? _authTimer;

  final AuthService _authService = AuthService();

  bool get isAuth {
    return authToken != null && authToken!.isValid;
  }

  AuthToken? get authToken {
    return _authToken;
  }

  void _setAuthToken(AuthToken token) {
    _authToken = token;
    _autoLogout();
    notifyListeners();
  }

  Future<void> signup(String email, String password) async {
    print(email);
    _setAuthToken(await _authService.signup(email, password));
  }

  Future<void> login(String email, String password) async {
    _setAuthToken(await _authService.login(email, password));
  }

  Future<bool> tryAutoLogin() async {
    final savedToken = await _authService.loadSavedAuthToken();
    if (savedToken == null) {
      return false;
    }

    _setAuthToken(savedToken);
    return true;
  }

  Future<void> logout() async {
    _authToken = null;
    if (_authTimer != null) {
      _authTimer!.cancel();
      _authTimer = null;
    }
    notifyListeners();
    _authService.clearSavedAuthToken();
  }

  void _autoLogout() {
    if (_authTimer != null) {
      _authTimer!.cancel();
    }
    final timeToExpiry =
        _authToken!.expiryDate.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  }
}
