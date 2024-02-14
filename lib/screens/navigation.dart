import 'package:Bliss/screens/blog.dart';
import 'package:Bliss/screens/map.dart';
import 'package:Bliss/widgets/navigation_drawer.dart';
import 'package:Bliss/screens/search_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  final screens = [
     WidgetGoogleMap(),
    const BlogPage(),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(62, 89, 84, 1),
      child: SafeArea(
        top: false,
        child: ClipRect(
          child: Scaffold(
            key: _key,
            drawer: DrawerMenu(onLogout: () {
              setState(() {});
              _key.currentState?.openEndDrawer();
            }),
            extendBody: true,
            appBar: AppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                systemNavigationBarColor: Color.fromRGBO(29, 37, 43, 1),
              ),
              leading: IconButton(
                icon: Icon(Iconsax.menu_1, color: Colors.grey[900]),
                onPressed: () => _key.currentState!.openDrawer(),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                    icon:
                        Icon(Iconsax.search_normal_1, color: Colors.grey[900]),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SearchScreen()),
                      );
                    },
                  ),
                ),
              ],
              title: const Text('Green-Bliss'),
              elevation: 0,
              centerTitle: true,
            ),
            body: screens[index],
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                  iconTheme: const IconThemeData(color: Colors.white)),
              child: CurvedNavigationBar(
                backgroundColor: Colors.transparent,
                color: const Color.fromRGBO(29, 37, 43, 1),
                height: 60,
                animationCurve: Curves.easeInOut,
                animationDuration: const Duration(milliseconds: 300),
                index: index,
                items: const [
                  Icon(Iconsax.map, size: 30),
                  Icon(Iconsax.bookmark, size: 30)
                ],
                onTap: (index) => setState(() => this.index = index),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
