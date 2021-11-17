import 'package:get_cloud/api/firebase_iauth.dart';
import 'package:rxdart/rxdart.dart';

class RegisterViewModel {
//init FirebaseIAtuh
  final firebaseIAuth _auth = firebaseIAuth().Singelton();

//init MutableLiveData "behaviorSubject"
  final BehaviorSubject<bool> _isRegistered = BehaviorSubject.seeded(false);
  final BehaviorSubject<bool> _loadingIndicator = BehaviorSubject.seeded(false);

//init LiveData "Streams"
  Stream<bool> get isRegistered => _isRegistered;
  Stream<bool> get loadingIndicator => _loadingIndicator;

//calling a register function from FirebaseIAuth
  Future<bool> registerWithEmailAndPassword(
      String username, String email, String password) async {
    _loadingIndicator.add(true);
    bool result = await _auth.register(username, email, password);
    if (result) {
      //need to call insteringDataIntoDatabase function to insert the data into cloud_fireStore
      _loadingIndicator.add(false);
      return true;
    } else {
      _loadingIndicator.add(false);
      return false;
    }
  }
}
