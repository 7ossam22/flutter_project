import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    } catch (e) {
      return false;
    }
  }
}
