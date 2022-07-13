import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:osteoapp/screens/guest/Guest.dart';
import 'package:osteoapp/screens/services/UserService.dart';

import '../../widgets/navigation_drawer.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  UserService _userService = UserService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text(
            'Paramètres',
            style: Theme.of(context).appBarTheme.titleTextStyle,
          ),
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  await _userService.logout();

                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GuestScreen()),
                    (route) => false,
                  );
                },
                child: Text("Déconnexion"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Changer le thème'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
