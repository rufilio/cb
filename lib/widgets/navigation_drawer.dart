import 'package:Bliss/screens/login.dart';
import 'package:Bliss/screens/help.dart';
import 'package:Bliss/screens/navigation.dart';
import 'package:Bliss/screens/settings_screen.dart';
import 'package:Bliss/widgets/drawer_item.dart';
import 'package:Bliss/screens/guide_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DrawerMenu extends StatelessWidget {
  final VoidCallback onLogout;
  const DrawerMenu({super.key, required this.onLogout});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 80, 24, 0),
          child: Column(
            children: [
              headerWidget(),
              const SizedBox(
                height: 40,
              ),
              const Divider(
                thickness: 1,
                height: 10,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 40,
              ),
              DrawerItem(
                  name: 'Inicio',
                  icon: Iconsax.home,
                  onPressed: () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            const NavigationPage(),
                      ),
                    );
                  }),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                  name: 'Guia de reciclaje',
                  icon: Iconsax.book,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GuidePage()),
                    );
                  }),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                  name: 'Ajustes',
                  icon: Iconsax.settings4,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SettingsPage()),
                    );
                  }),
              const SizedBox(
                height: 30,
              ),
              const Divider(
                thickness: 1,
                height: 10,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                  name: 'Ayuda & comentarios',
                  icon: Iconsax.info_circle,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FeedbackPage()),
                    );
                  }),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                name: FirebaseAuth.instance.currentUser != null
                    ? 'Cerrar Sesión'
                    : 'Acceder',
                icon: FirebaseAuth.instance.currentUser != null
                    ? Iconsax.logout
                    : Iconsax.login,
                onPressed: () {
                  if (FirebaseAuth.instance.currentUser != null) {
                    FirebaseAuth.instance.signOut();
                    onLogout();
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}) {}

  Widget headerWidget() {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: const Color.fromRGBO(62, 89, 84, 1).withOpacity(0.2),
          radius: 40,
          backgroundImage: const AssetImage('assets/casco.png'),
        ),
        const SizedBox(
          width: 20,
        ),
        Container(
          color: Colors.white,
          width: 120,
          child: const Text('Green-Bliss',
              style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        )
      ],
    );
  }
}
