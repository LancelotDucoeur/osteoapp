import 'package:flutter/cupertino.dart';

class NeakHorse extends CustomPainter {
  Path neakPath = Path();
  @override
  void paint(Canvas canvas, Size size) {
    Paint neakPaint = Paint()
      ..color = const Color.fromARGB(255, 0, 0, 0)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    neakPath.moveTo(size.width * 0.2391667, size.height * 0.1142857);
    neakPath.lineTo(size.width * 0.3016667, size.height * 0.1442857);
    neakPath.lineTo(size.width * 0.4141667, size.height * 0.2100000);
    neakPath.lineTo(size.width * 0.3658333, size.height * 0.3085714);
    neakPath.lineTo(size.width * 0.3400000, size.height * 0.3942857);
    neakPath.lineTo(size.width * 0.3025000, size.height * 0.3257143);
    neakPath.lineTo(size.width * 0.2841667, size.height * 0.2871429);
    neakPath.lineTo(size.width * 0.2541667, size.height * 0.2471429);
    neakPath.lineTo(size.width * 0.2591667, size.height * 0.2085714);
    neakPath.lineTo(size.width * 0.2566667, size.height * 0.1814286);
    neakPath.lineTo(size.width * 0.2391667, size.height * 0.1142857);
    neakPath.close();

    canvas.drawPath(neakPath, neakPaint);
  }

  @override
  bool hitTest(Offset position) {
    // _path - is the same one we built in paint() method;
    return neakPath.contains(position);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
