// abstract class FirebaseAuth {
//   static void login({required String username, required String password}) {}
//   static void register({required String username, required String password}) {}
// }
abstract class FirebaseAuth {
  static Future<bool> register(
      {required String username, required String password}) async {
    if (username.isNotEmpty && password.isNotEmpty) {
      return true;
    }
    return false;
  }

  static Future<bool> login({
    required String username,
    required String password,
  }) async {
    if (username.isNotEmpty && password.isNotEmpty) {
      return true;
    }
    return false;
  }
}
