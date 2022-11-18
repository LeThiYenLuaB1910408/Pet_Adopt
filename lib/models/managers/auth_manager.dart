import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:pet_adopt/models/managers/owner_manager.dart';
import 'package:pet_adopt/models/owner_model.dart';

import '../auth_token.dart';
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
    AuthToken token = await _authService.signup(email, password);
    _setAuthToken(token);
    await OwnerManager().addOwner(
      Owner(
        name: email,
        email: email,
        phone: '',
        address: '',
        image: '',
      ),
      token,
    );
  }

  Future<void> login(String email, String password) async {
    _setAuthToken(await _authService.login(email, password));
  }

  Future<bool> tryAutoLogin() async {
    print(777);
    final savedToken = await _authService.loadSavedAuthToken();
    print(888);
    if (savedToken == null) {
      return false;
    }
    print(savedToken.toJson());
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
