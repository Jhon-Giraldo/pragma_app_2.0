import 'package:flutter/material.dart';

import '../../../app_config.dart';
import '../../../blocs/bloc_auth.dart';
import '../../../blocs/bloc_responsive.dart';
import '../../../blocs/navigator_bloc.dart';
import '../../../entities/entity_config.dart';
import '../ui/pages/onboarding_page.dart';

class OnboardingConfig extends ConfigModule {
  @override
  void initConfigModule() async {
    final BlocAuth blocAuth = blocCore.getBlocModule<BlocAuth>(BlocAuth.name);
    final ResponsiveBloc responsiveBloc =
        blocCore.getBlocModule<ResponsiveBloc>(ResponsiveBloc.name);
    final NavigatorBloc navigatorBloc =
        blocCore.getBlocModule<NavigatorBloc>(NavigatorBloc.name);
    _setHomePage(responsiveBloc, blocAuth, navigatorBloc);
  }

  void _setHomePage(
    ResponsiveBloc responsiveBloc,
    BlocAuth blocAuth,
    NavigatorBloc navigatorBloc,
  ) {
    final Widget onboardingPage = OnboardingPage(
      responsiveBloc: responsiveBloc,
      navigatorBloc: navigatorBloc,
    );
  }
}
