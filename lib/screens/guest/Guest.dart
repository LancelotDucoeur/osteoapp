import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:osteoapp/models/UserModel.dart';
import 'package:osteoapp/screens/Home.dart';
import 'package:osteoapp/screens/guest/Auth.dart';
import 'package:osteoapp/screens/guest/Password.dart';
import 'package:osteoapp/screens/guest/Terms.dart';
import 'package:osteoapp/screens/services/UserService.dart';

class GuestScreen extends StatefulWidget {
  const GuestScreen({Key? key}) : super(key: key);

  @override
  State<GuestScreen> createState() => _GuestScreenState();
}

class _GuestScreenState extends State<GuestScreen> {
  UserService _userService = UserService();

  List<Widget> _widgets = [];
  int _indexSelected = 0;

  String _email = '';

  @override
  void initState() {
    super.initState();

    _widgets.addAll([
      AuthScreen(
          onChangedStep: (index, value) => setState(() {
                _indexSelected = index;
                _email = value;
              })),
      TermsScreen(
          onChangedStep: (index) => setState(() => _indexSelected = index)),
      PasswordScreen(
          onChangedStep: (index, value) => setState(() {
                if (index != 3) {
                  _indexSelected = index;
                }

                if (value != 3) {
                  _userService
                      .auth(UserModel(
                    email: _email,
                    password: value,
                  ))
                      .then(
                    (value) {
                      if (value.uid != null) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      }
                    },
                  );
                }
              })),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _widgets.elementAt(_indexSelected),
    );
  }
}
