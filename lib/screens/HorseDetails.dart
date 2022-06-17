/*import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HorseDetailsScreen extends StatefulWidget {
  const HorseDetailsScreen({Key? key}) : super(key: key);

  @override
  State<HorseDetailsScreen> createState() => _HorseDetailsScreenState();
}

class _HorseDetailsScreenState extends State<HorseDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insert Image Demo'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            GestureDetector(
              child: Image.asset('assets/images/horse.jpg'),
              onTapUp: (TapUpDetails details) => _onTapUp(details),
            )
          ],
        ),
      ),
    );
  }

  _onTapUp(TapUpDetails details) {
    var x = details.globalPosition.dx;
    var y = details.globalPosition.dy;
    print(details.localPosition.dx);
    if (x < 200) print("tap up " + x.toString() + ", " + y.toString());
  }
}
*/

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../shapes/horse/headHorse.dart';
import '../shapes/horse/neakHorse.dart';

class HorseDetailsScreen extends StatelessWidget {
  final double _width = 400.0;
  final GlobalKey head = new GlobalKey();
  final GlobalKey neak = new GlobalKey();
  final GlobalKey yellowCircle = new GlobalKey();
  final result = BoxHitTestResult();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            GestureDetector(
              child: CustomPaint(
                key: head,
                size: Size(
                    _width,
                    (_width * 1.811881188118812)
                        .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                painter: HeadHorse(),
              ),
              onTapUp: (TapUpDetails details) =>
                  {print(HeadHorse().hitTest(details.globalPosition))},
            ),
            /*GestureDetector(
              child: CustomPaint(
                key: neak,
                size: Size(
                    _width,
                    (_width * 0.5833333333333334)
                        .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                painter: NeakHorse(),
              ),
            ),*/
          ],
        ),
      ),
    );
  }

  handleClick(PointerEvent details) {
    if (isClicked(details, head)) {
      print("clicked the red circle");
    }
    if (isClicked(details, neak)) {
      print("clicked the blue circle");
    }
    if (isClicked(details, yellowCircle)) {
      print("clicked the yellow circle");
    }
  }

  bool isClicked(final PointerEvent details, final GlobalKey key) {
    /*final RenderObject circleBox = key.currentContext.findRenderObject();
    Offset localClick = circleBox.globalToLocal(details.position);
//    Offset localClick = details.localPosition
    if (circleBox.hitTest(result, position: localClick)) {
      return true;
    }*/
    return false;
  }
}
