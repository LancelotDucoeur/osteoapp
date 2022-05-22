import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:osteoapp/screens/Home.dart';
import 'package:osteoapp/screens/guest/Guest.dart';
import 'package:osteoapp/screens/services/UserService.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  UserService _userService = UserService();

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'osteoapp',
      home: StreamBuilder(
        stream: _userService.user,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return Home();
            }
            return const GuestScreen();
          }
          return const SafeArea(
            child: Scaffold(
              body: Center(
                child: Text('Chargement...'),
              ),
            ),
          );
        },
      ),
    );
  }
}
