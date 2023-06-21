abstract class EntityAuthenticationService {
  Future<Map<String, dynamic>> logIn(String email, String password);
  Future<Map<String, dynamic>> logOut();
  Future<Map<String, String>> verifyUserSession();
}
