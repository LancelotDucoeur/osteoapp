import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:osteoapp/screens/guest/Guest.dart';
import 'package:osteoapp/screens/services/UserService.dart';

import '../widgets/navigation_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  UserService _userService = UserService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Text('Accueil'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              await _userService.logout();

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const GuestScreen()),
                (route) => false,
              );
            },
            child: Text("Déconnexion"),
          ),
        ),
      ),
    );
  }
}
