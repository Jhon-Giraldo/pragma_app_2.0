import 'package:flutter/material.dart';

import '../../blocs/bloc_auth.dart';
import '../../blocs/bloc_responsive.dart';
import '../../blocs/navigator_bloc.dart';
import '../../models/bloc_auth_state.dart';
import '../../modules/onboarding/ui/pages/onboarding_page.dart';
import 'loading_animation_page.dart';

class LoginMainPage extends StatelessWidget {
  const LoginMainPage({
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
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      snapshot.data!.hasError!,
                      style: const TextStyle(color: Colors.white),
                    ),
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
          return LoginPage(blocAuth: blocAuth);
        },
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({required this.blocAuth, super.key});

  final BlocAuth blocAuth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/img/logo.png',
            width: 171,
          ),
          Text(
            'Somos pilotos',
            style: TextStyle(
              color: Theme.of(context).colorScheme.surfaceTint,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'de nuestro destino',
            style: TextStyle(
              color: Theme.of(context).colorScheme.outline,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Theme.of(context).buttonTheme.colorScheme!.surfaceTint,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            onPressed: () async {
              loginDialog(context);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.asset(
                  'assets/img/google_logo.png',
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Iniciar sesión con Google',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> loginDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Iniciar sesión'),
          actions: <Widget>[
            MaterialButton(
              onPressed: () {
                blocAuth.logIn('a@gmail.com', 'a');
                Navigator.pop(context);
              },
              child: const Text('Si'),
            ),
            MaterialButton(
              onPressed: () {
                blocAuth.logIn('', '');
                Navigator.pop(context);
              },
              child: const Text('No'),
            )
          ],
        );
      },
    );
  }
}
