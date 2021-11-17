import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_cloud/api/iauth.dart';

// ignore: camel_case_types
class firebaseIAuth extends IAuth {
//final Future<FirebaseApp> app = Firebase.initializeApp();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference _db =
      FirebaseFirestore.instance.collection('users');
  late String _user;
  // ignore: non_constant_identifier_names
  firebaseIAuth Singelton() {
    firebaseIAuth? instanse;
    instanse ??= firebaseIAuth();
    return instanse;
  }

  @override
  Future<bool> register(String username, String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _user = _auth.currentUser!.uid.toString();
      pushUserData(username, email, password);
      // ignore: avoid_print
      print('Current user is : $_user');
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> signin(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      _user = _auth.currentUser!.uid.toString();
      // ignore: avoid_print
      print('Current user is : $_user');
      return true;
    } catch (e) {
      // ignore: avoid_print
      print('Failed $e');
      return false;
    }
  }

  pushUserData(String username, String email, String password) async {
    if (username.isEmpty) {
      // ignore: avoid_print
      print(
          'Error: failed to push Data into fireStore cause the username recieved as a null');
      return false;
    } else {
      Map<dynamic, dynamic> userData = {
        'name': username,
        'email': email,
        'password': password,
        'profilePic': '',
        'usage': '0'
      };
      await _db.doc(_user.toString()).set(userData);
      return true;
    }
  }
}
