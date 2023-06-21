import 'dart:async';

import '../entities/entity_bloc.dart';
import '../models/bloc_auth_state.dart';
import '../models/model_user.dart';
import '../providers/auth_session_provider.dart';

class BlocAuth extends BlocModule {
  BlocAuth({required this.authSessionProvider});

  static String name = 'blocAuth';
  final AuthSessionProvider authSessionProvider;

  final BlocGeneral<BlocAuthState> _authBloc =
      BlocGeneral<BlocAuthState>(BlocAuthState.empty());
  Stream<BlocAuthState> get stream => _authBloc.stream;

  BlocAuthState get value => _authBloc.value;
  bool get isActiveSession => value.modelUser.isActiveSession;

  Future<void> logIn(String email, String password) async {
    try {
      _authBloc.value = _authBloc.value.copyWith(isLoading: true);
      final ModelUser modelUserResponse =
          await authSessionProvider.logIn(email, password);
      _authBloc.value = _authBloc.value.copyWith(modelUser: modelUserResponse);
    } catch (e) {
      _authBloc.value = _authBloc.value.copyWith(hasError: e.toString());
    } finally {
      _authBloc.value = _authBloc.value.copyWith(isLoading: false);
    }
  }

  Future<void> verifySession(
    void Function(BlocAuthState userModel) function,
  ) async {
    _addFunctionToSessionStream(
      'redirectToHomePage',
      function,
    );
  }

  void _addFunctionToSessionStream(
    String keyFunction,
    void Function(BlocAuthState userModel) function,
  ) {
    _authBloc.addFunctionToProcessTValueOnStream(keyFunction, function);
  }

  @override
  FutureOr<void> dispose() {
    _authBloc.dispose();
  }
}
