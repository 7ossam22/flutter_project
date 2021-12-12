import 'package:get_cloud/api/firebase_iauth.dart';
import 'package:get_cloud/model/user_model.dart';
import 'package:rxdart/rxdart.dart';

class HomeViewModel {
  //ToDo ---> init home viewModel here
  final firebaseIAuth _api = firebaseIAuth().Singelton();
  final BehaviorSubject<Future<UserModel>> _userModel = BehaviorSubject();
  final BehaviorSubject<String> _name = BehaviorSubject.seeded('');
  final BehaviorSubject<String> _email = BehaviorSubject.seeded('');
  final BehaviorSubject<String> _profilePic = BehaviorSubject.seeded('');
  final BehaviorSubject<String> _usage = BehaviorSubject.seeded('0');
  final BehaviorSubject<String> _bytes = BehaviorSubject.seeded('');

  Stream<Future<UserModel>> get userModel => _userModel;
  Stream<String> get name => _name;
  Stream<String> get email => _email;
  Stream<String> get profilePic => _profilePic;
  Stream<String> get usage => _usage;
  Stream<String> get bytes => _bytes;
  onGettingUserData() async {
    _api.getUserData().then((value) => _name.add(value.name));
    _api.getUserData().then((value) => _email.add(value.email));
    _api.getUserData().then((value) => _profilePic.add(value.profilePic));
    _api.getUserData().then((value) => _usage.add(value.usage.toString()));
    _api.getUserData().then((value) => onSizeFiltering(int.parse(value.usage)));
  }

  onSizeFiltering(int size) {
    double _sizeKb = size / 1024;
    double _sizeMb = _sizeKb / 1024;
    double _sizeGb = _sizeMb / 1024;
    double _sizeTb = _sizeGb / 1024;
    if (_sizeTb >= 1) {
      _bytes.add('${_sizeTb.toInt()} TB');
    } else if (_sizeGb >= 1) {
      _bytes.add('${_sizeGb.toInt()} GB');
    } else if (_sizeMb >= 1) {
      _bytes.add('${_sizeMb.toInt()} MB');
    } else if (_sizeKb >= 1) {
      _bytes.add('${_sizeKb.toInt()} KB');
    } else {
      _bytes.add('$size bytes');
    }
  }
}
