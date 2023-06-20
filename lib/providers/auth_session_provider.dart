import '../entities/entity_authentication_service.dart';
import '../entities/entity_provider.dart';
import '../models/model_user.dart';
import 'my_app_navigator_provider.dart';

class AuthSessionProvider extends Provider {
  AuthSessionProvider({required this.googleAuthService});
  final EntityAuthenticationService googleAuthService;

  Future<ModelUser> logIn(String email, String password) async {
    try {
      final Map<String, String> responseUser = Map<String, String>.from(
        await googleAuthService.logIn(email, password),
      );
      return ModelUser.fromJson(responseUser).copyWith(isActiveSession: true);
    } catch (e) {
      debugPrint('exception $e when trying to Login');
      rethrow;
    }
  }
}
