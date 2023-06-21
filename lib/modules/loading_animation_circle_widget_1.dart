import 'package:flutter/material.dart';

class LoadingAnimationCircleWidget1 extends StatefulWidget {
  const LoadingAnimationCircleWidget1({super.key});

  @override
  State<LoadingAnimationCircleWidget1> createState() =>
      _LoadingAnimationCircleWidget1State();
}

class _LoadingAnimationCircleWidget1State
    extends State<LoadingAnimationCircleWidget1>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  late TweenSequence<Offset> animationCircle;

  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();

    //Animación Tamaño
    scaleAnimation = TweenSequence<double>(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(
          begin: 1.0,
          end: 1.5,
        ),
        weight: 20,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(
          begin: 1.5,
          end: 1.5,
        ),
        weight: 20,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(
          begin: 1.5,
          end: 1.0,
        ),
        weight: 40,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(
          begin: 1.0,
          end: 1.5,
        ),
        weight: 40,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(
          begin: 1.5,
          end: 1.0,
        ),
        weight: 10,
      ),
    ]).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut),
    );

//Animación Movimiento
    animationCircle = TweenSequence<Offset>(<TweenSequenceItem<Offset>>[
      TweenSequenceItem<Offset>(
        tween: Tween<Offset>(
          begin: Offset.zero,
          end: Offset.zero,
        ),
        weight: 40,
      ),
      TweenSequenceItem<Offset>(
        tween: Tween<Offset>(
          begin: Offset.zero,
          end: const Offset(0.145, 0.0),
        ),
        weight: 20,
      ),
      TweenSequenceItem<Offset>(
        tween: Tween<Offset>(
          begin: const Offset(0.145, 0.0),
          end: const Offset(0.42, 0.0),
        ),
        weight: 20,
      ),
      TweenSequenceItem<Offset>(
        tween: Tween<Offset>(
          begin: const Offset(0.42, 0.0),
          end: const Offset(0.42, 0.0),
        ),
        weight: 40,
      ),
      TweenSequenceItem<Offset>(
        tween: Tween<Offset>(
          begin: const Offset(0.42, 0.0),
          end: Offset.zero,
        ),
        weight: 20,
      ),
    ]);

    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: SlideTransition(
        position: animationController.drive(animationCircle),
        child: CustomPaint(
          painter: CirclePainter(scale: scaleAnimation.value),
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  const CirclePainter({required this.scale});
  final double scale;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = const Color(0xFFFFFFFF)
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke;

    final double circleRadius = 6 * scale;
    final double widthCenter = size.width / 2;
    final double circleDiameter = circleRadius * 2;
    const double spaceBetween = 28;

    canvas.drawCircle(
      Offset(widthCenter - circleDiameter - spaceBetween, size.height / 2),
      circleRadius,
      paint,
    );
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) {
    return oldDelegate.scale != scale;
  }
}
