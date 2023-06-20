import '../models/model_user.dart';

class BlocAuthState {
  const BlocAuthState({
    required this.modelUser,
    required this.initState,
    required this.isLoading,
    required this.hasError,
  });

  BlocAuthState.empty({
    this.modelUser = const ModelUser(),
    this.initState = true,
    this.isLoading = false,
    this.hasError = '',
  });

  final ModelUser modelUser;
  final bool initState;
  final bool isLoading;
  final String hasError;

  BlocAuthState copyWith({
    ModelUser? modelUser,
    bool? initState,
    bool? isLoading,
    String? hasError,
  }) {
    return BlocAuthState(
      modelUser: modelUser ?? this.modelUser,
      initState: initState ?? this.initState,
      isLoading: isLoading ?? this.initState,
      hasError: hasError ?? this.hasError,
    );
  }
}
