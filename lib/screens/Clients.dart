import 'package:flutter/material.dart';
import 'package:osteoapp/widgets/navigation_drawer.dart';

class Clients extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Text('Clients'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Center(),
      ),
    );
  }
}
