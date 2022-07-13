import 'package:flutter/cupertino.dart';

class HeadHorse extends CustomPainter {
  bool test = false;
  Path headPath = Path();
  @override
  void paint(Canvas canvas, Size size) {
    Paint headPaint = Paint()
      ..color = const Color.fromARGB(255, 0, 0, 0)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    headPath.moveTo(size.width * 0.2141667, size.height * 0.1285714);
    headPath.lineTo(size.width * 0.1900000, size.height * 0.1742857);
    headPath.lineTo(size.width * 0.1925000, size.height * 0.1957143);
    headPath.lineTo(size.width * 0.1775000, size.height * 0.2871429);
    headPath.lineTo(size.width * 0.1850000, size.height * 0.3114286);
    headPath.lineTo(size.width * 0.1958333, size.height * 0.3285714);
    headPath.lineTo(size.width * 0.2158333, size.height * 0.3071429);
    headPath.lineTo(size.width * 0.2450000, size.height * 0.2542857);
    headPath.lineTo(size.width * 0.2583333, size.height * 0.2100000);
    headPath.lineTo(size.width * 0.2441667, size.height * 0.1300000);
    headPath.lineTo(size.width * 0.2266667, size.height * 0.0800000);
    headPath.lineTo(size.width * 0.2208333, size.height * 0.0714286);
    headPath.lineTo(size.width * 0.2183333, size.height * 0.1114286);
    headPath.lineTo(size.width * 0.2233333, size.height * 0.1142857);
    headPath.lineTo(size.width * 0.2108333, size.height * 0.0942857);
    headPath.lineTo(size.width * 0.2141667, size.height * 0.1285714);
    headPath.close();

    canvas.drawPath(headPath, headPaint);
    if (test) {
      final paint = Paint();
      paint.style = PaintingStyle.stroke;
      paint.strokeWidth = 1;
      paint.color = Color(0xffff0000);
      canvas.drawLine(
          new Offset(size.width * 0.1822222, size.height * 0.1140000),
          new Offset(size.width * 0.2122222, size.height * 0.2160000),
          paint);
      canvas.drawLine(
          new Offset(size.width * 0.2155556, size.height * 0.0980000),
          new Offset(size.width * 0.1811111, size.height * 0.2280000),
          paint);
    }
  }

  @override
  bool hitTest(Offset position) {
    // _path - is the same one we built in paint() method;
    return headPath.contains(position);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
