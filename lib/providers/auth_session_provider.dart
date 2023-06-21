import '../entities/entity_authentication_service.dart';
import '../entities/entity_provider.dart';
import '../exceptions/exceptions.dart';
import '../models/model_user.dart';

class AuthSessionProvider extends Provider {
  AuthSessionProvider({required this.googleAuthService});
  final EntityAuthenticationService googleAuthService;

  Future<ModelUser> logIn(String email, String password) async {
    final Map<String, dynamic> responseUser =
        await googleAuthService.logIn(email, password);
    if (responseUser.containsKey('error')) {
      final Exception errorResponse =
          Failure('${responseUser['error']['details']}');
      throw errorResponse;
    }
    return ModelUser.fromJson(Map<String, String>.from(responseUser))
        .copyWith(isActiveSession: true);
  }
}
