import 'package:flutter/material.dart';
import 'package:login_app/Model/user_model.dart';

class AuthProvider extends ChangeNotifier {
  UserModel? _currentUser;

  UserModel? get user => _currentUser;
  bool get isloggedIn => _currentUser != null;

  void login(String email, String password) {
    if (email.isEmpty || password.isEmpty) return;
    if (!email.endsWith('@gmail.com')) return;
    _currentUser = UserModel(email: email, password: password);
    notifyListeners();
  }

  void setEmail(String newemail) {
    _currentUser?.email = newemail;
    notifyListeners();
  }

  void setPassword(String newPassword) {
    _currentUser?.password = newPassword;
    notifyListeners();
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }
}
