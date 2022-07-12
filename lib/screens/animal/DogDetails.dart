import 'package:flutter/material.dart';

class DogDetailsScreen extends StatelessWidget {
  final double _width = 600.0;
  final GlobalKey head = new GlobalKey();
  final GlobalKey neak = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [Text("chien")],
        ),
      ),
    );
  }
}
