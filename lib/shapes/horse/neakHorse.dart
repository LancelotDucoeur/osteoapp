import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NeakHorse extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = const Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width * 0.2391667, size.height * 0.1142857);
    path0.lineTo(size.width * 0.3016667, size.height * 0.1442857);
    path0.lineTo(size.width * 0.4141667, size.height * 0.2100000);
    path0.lineTo(size.width * 0.3658333, size.height * 0.3085714);
    path0.lineTo(size.width * 0.3400000, size.height * 0.3942857);
    path0.lineTo(size.width * 0.3025000, size.height * 0.3257143);
    path0.lineTo(size.width * 0.2841667, size.height * 0.2871429);
    path0.lineTo(size.width * 0.2541667, size.height * 0.2471429);
    path0.lineTo(size.width * 0.2591667, size.height * 0.2085714);
    path0.lineTo(size.width * 0.2566667, size.height * 0.1814286);
    path0.lineTo(size.width * 0.2391667, size.height * 0.1142857);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
