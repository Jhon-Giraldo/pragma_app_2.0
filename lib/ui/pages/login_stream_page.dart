import 'package:flutter/material.dart';

import '../../blocs/bloc_auth.dart';
import '../../blocs/bloc_responsive.dart';
import '../../blocs/navigator_bloc.dart';
import '../../models/bloc_auth_state.dart';
import '../../modules/onboarding/ui/pages/onboarding_page.dart';
import '../widgets/login_access_widget.dart';
import 'loading_animation_page.dart';

class LoginStreamPage extends StatelessWidget {
  const LoginStreamPage({
    required this.blocAuth,
    required this.responsivebLOC,
    required this.navigatorBloc,
    super.key,
  });

  final BlocAuth blocAuth;
  final ResponsiveBloc responsivebLOC;
  final NavigatorBloc navigatorBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: StreamBuilder<BlocAuthState>(
        stream: blocAuth.stream,
        builder: (BuildContext context, AsyncSnapshot<BlocAuthState> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data?.isLoading ?? false) {
              return const LoadingAnimationPage();
            }
            if (snapshot.data?.hasError != null) {
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      snapshot.data!.hasError!,
                      style: const TextStyle(color: Colors.white),
                    )
                  ],
                ),
              );
            }
            if (snapshot.data?.modelUser.isActiveSession ?? false) {
              return OnboardingPage(
                navigatorBloc: navigatorBloc,
                responsiveBloc: responsivebLOC,
              );
            }
          }
          return LoginAccessWidget(blocAuth: blocAuth);
        },
      ),
    );
  }
}
