import 'package:get_cloud/model/user_model.dart';

abstract class IAuth {
  Future<bool> signin(String email, String password);
  Future<bool> register(String username, String email, String password);
  Future<UserModel> getUserData();
  Future<bool> pushUserData(String username, String email, String password);
}
