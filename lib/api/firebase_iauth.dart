import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_cloud/api/iauth.dart';

// ignore: camel_case_types
class firebaseIAuth extends IAuth {
//final Future<FirebaseApp> app = Firebase.initializeApp();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // ignore: non_constant_identifier_names
  firebaseIAuth Singelton() {
    firebaseIAuth? instanse;
    instanse ??= firebaseIAuth();
    return instanse;
  }

  @override
  Future<bool> register() {
    throw UnimplementedError();
  }

  @override
  Future<bool> signin(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      // ignore: unused_local_variable
      String user = _auth.currentUser!.uid.toString();
      // ignore: avoid_print
      print('Current user is : ${user.toString()}');
      return true;
    } catch (e) {
      // ignore: avoid_print
      print('Failed $e');
      return false;
    }
  }
}
