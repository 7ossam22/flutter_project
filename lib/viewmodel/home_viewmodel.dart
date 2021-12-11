import 'package:get_cloud/api/firebase_iauth.dart';
import 'package:get_cloud/model/user_model.dart';
import 'package:rxdart/rxdart.dart';

class HomeViewModel {
  //ToDo ---> init home viewModel here
  final firebaseIAuth _api = firebaseIAuth().Singelton();
  final BehaviorSubject<Future<UserModel>> _userModel =
      BehaviorSubject<Future<UserModel>>();
  final BehaviorSubject<String> _name = BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> _email = BehaviorSubject<String>.seeded('');
  final BehaviorSubject<String> _profilePic =
      BehaviorSubject<String>.seeded('');
  final BehaviorSubject<double> _usage = BehaviorSubject<double>.seeded(0);

  Stream<Future<UserModel>> get userModel => _userModel;
  Stream<String> get name => _name;
  Stream<String> get email => _email;
  Stream<String> get profilePic => _profilePic;
  Stream<double> get usage => _usage;
  onGettingUserData() async {
    _api.getUserData().then((value) => _name.add(value.name));
    _api.getUserData().then((value) => _email.add(value.email));
    _api.getUserData().then((value) => _profilePic.add(value.profilePic));
    _api.getUserData().then((value) => sizeFilter(int.parse(value.usage)));
  }

  sizeFilter(int size) {
    int _sizeByte = size;
    double _sizeKb = _sizeByte / 1024;
    double _sizeMb = _sizeKb / 1024;
    double _sizeGb = _sizeMb / 1024;
    double _sizeTb = _sizeGb / 1024;
    if (_sizeTb >= 1) {
      _usage.add(_sizeTb);
    } else if (_sizeGb >= 1) {
      _usage.add(_sizeGb);
    } else if (_sizeMb >= 1) {
      _usage.add(_sizeMb);
    } else if (_sizeKb >= 1) {
      _usage.add(_sizeKb);
    } else {
      _usage.add(double.parse(_sizeByte.toString()));
    }
  }
}
