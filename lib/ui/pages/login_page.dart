import 'package:flutter/material.dart';

import '../../blocs/bloc_auth.dart';
import '../../blocs/bloc_auth_state.dart';

class LoginMainPage extends StatelessWidget {
  const LoginMainPage({
    required this.blocAuth,
    super.key,
  });

  final BlocAuth blocAuth;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BlocAuthState>(
      stream: blocAuth.stream,
      builder: (BuildContext context, AsyncSnapshot<BlocAuthState> snapshot) {
        if (snapshot.data?.isLoading ?? false) {
          return const Text(
            'loading',
            style: TextStyle(color: Colors.white),
          );
        }
        if (snapshot.data?.hasError != null) {
          // showDialog(
          //   context: context,
          //   builder: (BuildContext context) {
          //     return AlertDialog(
          //       title: const Text('An error has occurred!'),
          //       content: Text(snapshot.data!.hasError),
          //       actions: <Widget>[
          //         MaterialButton(
          //           onPressed: () => Navigator.of(context).pop(),
          //           child: const Text('Accept'),
          //         )
          //       ],
          //     );
          //   },
          // );
          return Text(
            snapshot.data!.hasError,
            style: TextStyle(color: Colors.white),
          );
        }
        if (snapshot.data?.modelUser.isActiveSession ?? false) {
          return const Text('On boarding',
              style: TextStyle(color: Colors.white));
        }
        return LoginPage(blocAuth: blocAuth);
      },
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({required this.blocAuth, super.key});

  final BlocAuth blocAuth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
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
                blocAuth.logIn('', '');
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.center,
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
      ),
    );
  }
}
