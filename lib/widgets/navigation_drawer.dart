import 'package:flutter/material.dart';
import 'package:osteoapp/screens/maps/Maps.dart';
import 'package:osteoapp/screens/planning/Planning.dart';
import 'package:osteoapp/screens/Home.dart';
import 'package:osteoapp/screens/settings/Settings.dart';
import 'package:osteoapp/screens/client/Clients.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  const NavigationDrawerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const name = 'toto';
    const email = 'toto@gmail.com';
    const urlImage =
        'https://www.actuabd.com/local/cache-vignettes/L128xH244/arton10739-8c07d.jpg?1579983112';
    return Drawer(
        child: Material(
            color: const Color.fromRGBO(50, 75, 205, 1),
            child: ListView(padding: padding, children: <Widget>[
              /* buildHeader(
                urlImage: urlImage,
                name: name,
                email: email,
              ),*/
              const Divider(color: Colors.white70),
              const SizedBox(
                height: 16,
              ),
              buildMenuItem(
                  text: "Accueil",
                  icon: Icons.home,
                  onClicked: () => selectedItem(context, 0)),
              const SizedBox(
                height: 16,
              ),
              buildMenuItem(
                  text: "Planning",
                  icon: Icons.calendar_today,
                  onClicked: () => selectedItem(context, 1)),
              const SizedBox(
                height: 16,
              ),
              buildMenuItem(
                  text: "Client",
                  icon: Icons.people,
                  onClicked: () => selectedItem(context, 2)),
              const SizedBox(
                height: 16,
              ),
              buildMenuItem(
                  text: "Maps",
                  icon: Icons.map,
                  onClicked: () => selectedItem(context, 3)),
              const SizedBox(
                height: 24,
              ),
              const Divider(color: Colors.white70),
              const SizedBox(
                height: 24,
              ),
              buildMenuItem(
                  text: "Paramètres",
                  icon: Icons.settings_applications_outlined,
                  onClicked: () => selectedItem(context, 4)),
            ])));
  }

  buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = Colors.white;
    const hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: const TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PlanningScreen(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ClientsScreen(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MapsScreen(),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SettingsScreen(),
        ));
        break;
      default:
    }
  }

  buildHeader(
          {required String urlImage,
          required String name,
          required String email}) =>
      InkWell(
          child: Container(
              padding: padding.add(const EdgeInsets.symmetric(vertical: 40)),
              child: Row(children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(urlImage),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      email,
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              ])));
}
