import 'package:flutter/material.dart';
import '../../shapes/horse/headHorse.dart';
import '../../shapes/horse/neakHorse.dart';

class HorseDetailsScreen extends StatelessWidget {
  final double _width = 600.0;
  final GlobalKey head = new GlobalKey();
  final GlobalKey neak = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            GestureDetector(
              child: CustomPaint(
                key: head,
                size: Size(
                    _width,
                    (_width * 0.5833333333333334)
                        .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                painter: HeadHorse(),
              ),
              onTapUp: (TapUpDetails details) => {
                if (!HeadHorse().hitTest(details.globalPosition))
                  {print("head")}
              },
            ),
            GestureDetector(
              child: CustomPaint(
                key: neak,
                size: Size(
                    _width,
                    (_width * 0.5833333333333334)
                        .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                painter: NeakHorse(),
              ),
              onTapUp: (TapUpDetails details) => {
                if (!NeakHorse().hitTest(details.globalPosition))
                  {print("neak")}
              },
            ),
          ],
        ),
      ),
    );
  }
}
