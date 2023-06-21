import '../../../app_config.dart';
import '../../../blocs/bloc_responsive.dart';
import '../../../blocs/navigator_bloc.dart';

class OnboardingConfig {
  Future<void> initConfigModule() async {
    final ResponsiveBloc responsiveBloc =
        blocCore.getBlocModule<ResponsiveBloc>(ResponsiveBloc.name);
    final NavigatorBloc navigatorBloc =
        blocCore.getBlocModule<NavigatorBloc>(NavigatorBloc.name);
  }
}
