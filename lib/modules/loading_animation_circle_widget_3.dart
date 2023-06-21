import 'package:flutter/material.dart';

class LoadingAnimationCircleWidget3 extends StatefulWidget {
  const LoadingAnimationCircleWidget3({super.key});

  @override
  State<LoadingAnimationCircleWidget3> createState() =>
      _LoadingAnimationCircleWidget3State();
}

class _LoadingAnimationCircleWidget3State
    extends State<LoadingAnimationCircleWidget3>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  late TweenSequence<Offset> animationCircle;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();

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
          end: const Offset(-0.26, 0.0),
        ),
        weight: 20,
      ),
      TweenSequenceItem<Offset>(
        tween: Tween<Offset>(
          begin: const Offset(-0.26, 0.0),
          end: const Offset(-0.26, 0.0),
        ),
        weight: 20,
      ),
      TweenSequenceItem<Offset>(
        tween: Tween<Offset>(
          begin: const Offset(-0.26, 0.0),
          end: const Offset(-0.1, 0.0),
        ),
        weight: 20,
      ),
      TweenSequenceItem<Offset>(
        tween: Tween<Offset>(
          begin: const Offset(-0.1, 0.0),
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
          painter: CirclePainter(),
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = const Color(0xFFFFFFFF)
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke;

    const double circleRadius = 6;
    final double widthCenter = size.width / 2;
    const double spaceBetween = 28;

    // Círculo segundo desde la derecha
    canvas.drawCircle(
      Offset(widthCenter + circleRadius + spaceBetween - 29, size.height / 2),
      circleRadius,
      paint,
    );
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) {
    return true;
  }
}
