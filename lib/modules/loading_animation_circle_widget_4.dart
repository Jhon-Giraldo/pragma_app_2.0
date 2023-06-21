import 'package:flutter/material.dart';

class LoadingAnimationCircleWidget4 extends StatefulWidget {
  const LoadingAnimationCircleWidget4({super.key});

  @override
  State<LoadingAnimationCircleWidget4> createState() =>
      _LoadingAnimationCircleWidget4State();
}

class _LoadingAnimationCircleWidget4State
    extends State<LoadingAnimationCircleWidget4>
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
          end: const Offset(-0.19, 0.0),
        ),
        weight: 20,
      ),
      TweenSequenceItem<Offset>(
        tween: Tween<Offset>(
          begin: const Offset(-0.19, 0.0),
          end: const Offset(-0.28, 0.0),
        ),
        weight: 20,
      ),
      TweenSequenceItem<Offset>(
        tween: Tween<Offset>(
          begin: const Offset(-0.28, 0.0),
          end: const Offset(-0.19, 0.0),
        ),
        weight: 20,
      ),
      TweenSequenceItem<Offset>(
        tween: Tween<Offset>(
          begin: const Offset(-0.19, 0.0),
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
        child: const CustomPaint(
          painter: CirclePainter(),
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  const CirclePainter();

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = const Color(0xFFFFFFFF)
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke;

    const double circleRadius = 6;
    final double widthCenter = size.width / 2;
    const double circleDiameter = circleRadius * 2;
    const double spaceBetween = 28;

    // Círculo más a la derecha
    canvas.drawCircle(
      Offset(widthCenter + circleDiameter + spaceBetween + 2, size.height / 2),
      circleRadius,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
