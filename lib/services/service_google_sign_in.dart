import '../entities/entity_authentication_service.dart';
import '../mock/mock_google_session_data_provider.dart';

class ServiceGoogleSignIn extends EntityAuthenticationService {
  ServiceGoogleSignIn({required this.mockGoogleSessionDataProvider});

  final MockGoogleSessionDataProvider mockGoogleSessionDataProvider;

  @override
  Future<Map<String, dynamic>> logIn(String email, String password) async {
    final Map<String, dynamic> response =
        await mockGoogleSessionDataProvider.signInSessionData(email, password);
    return response;
  }

  @override
  Future<Map<String, dynamic>> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  Future<Map<String, String>> verifyUserSession() {
    // TODO: implement logOut
    throw UnimplementedError();
  }
}
