import 'package:flutter/material.dart';

import 'loading_animation_circle_widget_1.dart';
import 'loading_animation_circle_widget_2.dart';
import 'loading_animation_circle_widget_3.dart';
import 'loading_animation_circle_widget_4.dart';

void main() {
  runApp(const LoadingAnimationPage());
}

class LoadingAnimationPage extends StatelessWidget {
  const LoadingAnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF170339),
        body: Center(
          child: Stack(
            children: <Widget>[
              LoadingAnimationCircleWidget1(),
              LoadingAnimationCircleWidget2(),
              LoadingAnimationCircleWidget3(),
              LoadingAnimationCircleWidget4()
            ],
          ),
        ),
      ),
    );
  }
}
