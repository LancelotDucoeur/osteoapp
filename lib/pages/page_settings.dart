import 'package:flutter/material.dart';
import 'package:osteoapp/widgets/navigation_drawer.dart';

class PageSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Text('Paramètres'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Center(),
      ),
    );
  }
}
