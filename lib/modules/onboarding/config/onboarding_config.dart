import '../../../entities/entity_config.dart';

class OnboardingConfig extends ConfigModule {
  @override
  Future<void> initConfigModule() async {
    // final BlocAuth blocAuth = blocCore.getBlocModule<BlocAuth>(BlocAuth.name);
    // final ResponsiveBloc responsiveBloc =
    //     blocCore.getBlocModule<ResponsiveBloc>(ResponsiveBloc.name);
    // final NavigatorBloc navigatorBloc =
    //     blocCore.getBlocModule<NavigatorBloc>(NavigatorBloc.name);
    //_setHomePage(responsiveBloc, blocAuth, navigatorBloc);
  }

  // void _setHomePage(
  //   ResponsiveBloc responsiveBloc,
  //   BlocAuth blocAuth,
  //   NavigatorBloc navigatorBloc,
  // ) {
  //   final Widget onboardingPage = OnboardingPage(
  //     responsiveBloc: responsiveBloc,
  //     navigatorBloc: navigatorBloc,
  //   );
  // }
}
