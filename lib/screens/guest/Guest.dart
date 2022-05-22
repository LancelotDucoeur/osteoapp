import 'package:flutter/material.dart';
import 'package:osteoapp/screens/guest/Auth.dart';
import 'package:osteoapp/screens/guest/Password.dart';
import 'package:osteoapp/screens/guest/Terms.dart';

class GuestScreen extends StatefulWidget {
  const GuestScreen({Key? key}) : super(key: key);

  @override
  State<GuestScreen> createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  List<Widget> _widgets = [];
  int _indexSelected = 0;

  @override
  void initState() {
    super.initState();

    _widgets.addAll([
      AuthScreen(
          onChangedStep: (index) => setState(() => _indexSelected = index)),
      TermsScreen(
          onChangedStep: (index) => setState(() => _indexSelected = index)),
      PasswordScreen(
          onChangedStep: (index) => setState(() => _indexSelected = index)),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _widgets.elementAt(_indexSelected),
    );
  }
}
