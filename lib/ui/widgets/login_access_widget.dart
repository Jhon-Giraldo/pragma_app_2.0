import 'package:flutter/material.dart';

import '../../blocs/bloc_auth.dart';

class LoginAccessWidget extends StatelessWidget {
  const LoginAccessWidget({required this.blocAuth, super.key});

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
