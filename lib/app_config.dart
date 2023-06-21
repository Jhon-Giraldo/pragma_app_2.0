import 'dart:async';

import 'blocs/bloc_auth.dart';
import 'blocs/bloc_drawer.dart';
import 'blocs/bloc_processing.dart';
import 'blocs/bloc_responsive.dart';
import 'blocs/bloc_secondary_drawer.dart';
import 'blocs/navigator_bloc.dart';
import 'blocs/onboarding_bloc.dart';
import 'blocs/theme_bloc.dart';
import 'entities/entity_bloc.dart';
import 'mock/mock_google_session_data_provider.dart';
import 'modules/demo/blocs/bloc_demo.dart';
import 'providers/auth_session_provider.dart';
import 'providers/my_app_navigator_provider.dart';
import 'services/service_google_sign_in.dart';
import 'services/theme_config.dart';
import 'services/theme_service.dart';
import 'ui/pages/login_page.dart';
import 'ui/pages/my_onboarding_page.dart';

bool _init = false;
bool get isInit => _init;

/// Zona de configuración inicial
final BlocCore<dynamic> blocCore = BlocCore<dynamic>(<String, BlocModule>{
  ResponsiveBloc.name: ResponsiveBloc(),
  BlocProcessing.name: BlocProcessing(),
  DrawerMainMenuBloc.name: DrawerMainMenuBloc(),
  DrawerSecondaryMenuBloc.name: DrawerSecondaryMenuBloc(),
  NavigatorBloc.name: NavigatorBloc(myPageManager),
  BlocAuth.name: BlocAuth(
    authSessionProvider: AuthSessionProvider(
      googleAuthService: ServiceGoogleSignIn(
        mockGoogleSessionDataProvider: MockGoogleSessionDataProvider(),
      ),
    ),
  )
});

FutureOr<void> testMe() async {
  await Future<void>.delayed(
    const Duration(seconds: 2),
  );
}

FutureOr<void> demoInsert(BlocCore<dynamic> blocCoreInt) async {
  blocCoreInt
      .getBlocModule<NavigatorBloc>(NavigatorBloc.name)
      .setHomePageAndUpdate(
        LoginMainPage(
          navigatorBloc: blocCoreInt.getBlocModule(NavigatorBloc.name),
          responsivebLOC: blocCoreInt.getBlocModule(ResponsiveBloc.name),
          blocAuth: blocCoreInt.getBlocModule<BlocAuth>(BlocAuth.name),
        ),
      );

  blocCoreInt
      .getBlocModule<NavigatorBloc>(NavigatorBloc.name)
      .setTitle('Pragma App');
}

Future<void> onboarding({
  BlocCore<dynamic>? blocCoreExt,
  Duration initialDelay = const Duration(seconds: 2),
}) async {
  if (!_init) {
    final BlocCore<dynamic> blocCoreInt = blocCoreExt ?? blocCore;

    /// Register modules to use
    /// Inicializamos el responsive y la ux del usuario
    // inyectamos el tema
    blocCoreInt.addBlocModule(
      ThemeBloc.name,
      ThemeBloc(
        ThemeService(
          lightColorScheme: lightColorScheme,
          darkColorScheme: darkColorScheme,
          colorSeed: colorSeed,
          isDark: true,
        ),
      ),
    );

    // Inyectamos el demo
    blocCoreInt.addBlocModule(
      BlocDemo.name,
      BlocDemo(
        drawerMainMenuBloc: blocCoreInt
            .getBlocModule<DrawerMainMenuBloc>(DrawerMainMenuBloc.name),
        drawerSecondaryMenuBloc:
            blocCoreInt.getBlocModule<DrawerSecondaryMenuBloc>(
          DrawerSecondaryMenuBloc.name,
        ),
      ),
    );
    blocCoreInt.addBlocModule(
      OnboardingBloc.name,
      OnboardingBloc(
        <FutureOr<void> Function()>[
          () async {
            await demoInsert(blocCoreInt);
          }
        ],
      ),
    );

// redirigimos al onboarding
    blocCoreInt
        .getBlocModule<NavigatorBloc>(NavigatorBloc.name)
        .setHomePageAndUpdate(
          MyOnboardingPage(
            onboardingBloc:
                blocCoreInt.getBlocModule<OnboardingBloc>(OnboardingBloc.name),
            responsiveBloc:
                blocCoreInt.getBlocModule<ResponsiveBloc>(ResponsiveBloc.name),
          ),
        );

    /// register onboarding
    _init = true;
  }
}
