abstract class IAuth {
  Future<bool> signin(String email, String password);
  Future<bool> register();
}
