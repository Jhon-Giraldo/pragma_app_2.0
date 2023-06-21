import 'package:flutter/material.dart';

import '../widgets/loading_animation_circle/loading_animation_circle_widget_1.dart';
import '../widgets/loading_animation_circle/loading_animation_circle_widget_2.dart';
import '../widgets/loading_animation_circle/loading_animation_circle_widget_3.dart';
import '../widgets/loading_animation_circle/loading_animation_circle_widget_4.dart';

class LoadingAnimationPage extends StatelessWidget {
  const LoadingAnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: const Center(
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
