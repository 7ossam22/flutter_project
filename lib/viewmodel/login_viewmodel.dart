import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_cloud/api/firebase_iauth.dart';
import 'package:rxdart/rxdart.dart';

class LoginViewModel {
  //declaring a ViewModel class for our Login ui
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
      Navigator.pushReplacementNamed(context, '/home');
      Fluttertoast.showToast(
        msg: "Logged in Successfully",
        textColor: Colors.black,
        backgroundColor: Colors.grey,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
      _loadingIndicator.add(false);
      return true;
    } else {
      _loadingIndicator.add(false);
      Fluttertoast.showToast(
        msg: "Logged in Failed",
        textColor: Colors.black,
        backgroundColor: Colors.grey,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
      );
      return false;
    }
    // ignore: avoid_print, dead_code
    print(result);
  }
}
