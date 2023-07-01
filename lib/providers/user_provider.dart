// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// import 'package:instagram/resources/auth_methods.dart';
// import 'package:flutter/widgets.dart';
// import 'package:instagram/models/user.dart';

// class UserProvider with ChangeNotifier {
//   User? _user;
//   final AuthMethods _authMethods = AuthMethods();

//   User get getUser => _user!;

//   Future<void> refeshUser() async {
//     User user = await _authMethods.getUserDetails();

//     // if (user != null) {
//     _user = user!;
//     print("hogya");
//     notifyListeners();
//   }
// }
import 'package:flutter/widgets.dart';
import 'package:instagram/models/user.dart';
import 'package:instagram/resources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final AuthMethods _authMethods = AuthMethods();

  User get getUser => _user!;

  Future<void> refreshUser() async {
    User user = await _authMethods.getUserDetails();
    _user = user;
    notifyListeners();
  }
}
