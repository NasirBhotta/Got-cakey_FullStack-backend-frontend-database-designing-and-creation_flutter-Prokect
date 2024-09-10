import 'package:flutter/material.dart';
import 'package:got_cakey_mobile/model/auth.dart';

class AuthProvider extends ChangeNotifier {
  User _user = User(email: '', id: 0, password: '', token: '', type: '');

  User get user => _user;

  void setUser(Map<String, dynamic> user) {
    _user = User.fromJson(user);
    notifyListeners();
  }

  void setUserFromModel(User user) {
    _user = user;
    notifyListeners();
  }
}
