import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  String? _username;
  bool _isGuest = false;

  String? get username => _username;
  bool get isGuest => _isGuest;

  bool get isLoggedIn => _username != null && !_isGuest;

  Future<void> login(String username) async {
    _username = username;
    _isGuest = false;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    notifyListeners();
  }

  Future<void> guestLogin() async {
    _isGuest = true;
    notifyListeners();
  }

  Future<void> logout() async {
    _username = null;
    _isGuest = false;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    notifyListeners();
  }

  Future<void> checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _username = prefs.getString('username');
    notifyListeners();
  }
}
