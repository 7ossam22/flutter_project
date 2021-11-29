import 'package:flutter/material.dart';
import 'package:get_cloud/api/firebase_iauth.dart';
import 'package:rxdart/rxdart.dart';

class LoginViewModel {
  //declaing a ViewModel class for our Login ui
  final firebaseIAuth _auth = firebaseIAuth().Singelton();
  //init your streams "LiveData"
  // ignore: unnecessary_new

  final BehaviorSubject<bool> _loadingIndicator =
      BehaviorSubject<bool>.seeded(false);
  final BehaviorSubject<bool> _isLoggedIn = BehaviorSubject<bool>.seeded(false);

  Stream<bool> get loadingIndicator => _loadingIndicator.stream;
  Stream<bool> get isLoggedIn => _isLoggedIn.stream;

  Future<bool> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    _loadingIndicator.add(true);
    bool result = await _auth.signin(email, password);
    if (result) {
      _isLoggedIn.add(true);
      Navigator.pushReplacementNamed(context, '/home');
      _loadingIndicator.add(false);
      return true;
    } else {
      _isLoggedIn.add(false);
      _loadingIndicator.add(false);
      return false;
    }
    // ignore: avoid_print, dead_code
    print(result);
  }
}
