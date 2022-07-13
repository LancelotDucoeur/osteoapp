import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:osteoapp/screens/Home.dart';
import 'package:osteoapp/screens/guest/Guest.dart';
import 'package:osteoapp/screens/services/UserService.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';

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
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
        appBarTheme: AppBarTheme(color: Colors.blue),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        appBarTheme: AppBarTheme(color: Colors.red),
      ),
      themeMode: ThemeMode.dark,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('fr'),
      ],
      locale: const Locale('fr'),
      debugShowCheckedModeBanner: false,
      title: 'osteoapp',
      home: StreamBuilder(
        stream: _userService.user,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              return HomeScreen();
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
