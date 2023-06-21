class MockGoogleSessionDataProvider {
  Future<Map<String, dynamic>> signInSessionData(
    String email,
    String password,
  ) {
    if (email == '') {
      return Future<Map<String, dynamic>>.delayed(
        const Duration(seconds: 2),
        () => <String, dynamic>{
          'error': <String, String>{
            'code': 'sign_in_failed',
            'details': 'access denied',
            'message': 'com.google.GIDSignIn'
          }
        },
      );
    } else {
      return Future<Map<String, String>>.delayed(
        const Duration(seconds: 1),
        () => <String, String>{
          'email': 'la-orden-del-fenix@pragma.com.co',
          'name': 'La Orden del Fenix',
          'urlPhoto': 'fenix-in-flames.png',
          'accessToken': 'valid',
        },
      );
    }
  }
}
