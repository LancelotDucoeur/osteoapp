import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as UI;

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class HeadHorse extends CustomPainter {
  Path path0 = Path();
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = Color.fromARGB(255, 248, 14, 14)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Paint paint1 = Paint()
      ..color = const Color.fromARGB(255, 0, 0, 0)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    path0.moveTo(size.width * 0.4158416, size.height * 0.0710383);
    path0.lineTo(size.width * 0.4257426, size.height * 0.1912568);
    path0.lineTo(size.width * 0.4554455, size.height * 0.2295082);
    path0.lineTo(size.width * 0.2277228, size.height * 0.3825137);
    path0.lineTo(size.width * 0.1881188, size.height * 0.4098361);
    path0.lineTo(size.width * 0.2376238, size.height * 0.5027322);
    path0.lineTo(size.width * 0.0693069, size.height * 0.7814208);
    path0.lineTo(size.width * 0.0396040, size.height * 0.8524590);
    path0.lineTo(size.width * 0.0792079, size.height * 0.9016393);
    path0.lineTo(size.width * 0.1881188, size.height * 0.9508197);
    path0.lineTo(size.width * 0.2871287, size.height * 0.9617486);
    path0.lineTo(size.width * 0.3960396, size.height * 0.9617486);
    path0.lineTo(size.width * 0.5148515, size.height * 0.8469945);
    path0.lineTo(size.width * 0.7821782, size.height * 0.7213115);
    path0.lineTo(size.width * 0.9603960, size.height * 0.6448087);
    path0.lineTo(size.width * 0.9603960, size.height * 0.4863388);
    path0.lineTo(size.width * 0.8712871, size.height * 0.3169399);
    path0.lineTo(size.width * 0.6336634, size.height * 0.0710383);
    path0.lineTo(size.width * 0.5544554, size.height * 0.0327869);
    path0.lineTo(size.width * 0.5940594, size.height * 0.1912568);
    path0.lineTo(size.width * 0.4158416, size.height * 0.0710383);
    path0.close();

    Path path1 = Path();
    path1.lineTo(0, 0);
    path1.lineTo(size.width, 0);
    path1.lineTo(size.width, size.height);
    path1.lineTo(0, size.height);
    path1.close();

    canvas.drawPath(path0, paint1);
  }

  @override
  bool hitTest(Offset position) {
    // _path - is the same one we built in paint() method;
    return path0.contains(position);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
