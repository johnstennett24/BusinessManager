import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurantapp/homePage.dart';
import 'package:restaurantapp/NewEntry.dart';
import 'package:restaurantapp/routes.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedIconTheme: const IconThemeData(color: Colors.amber, size: 30),
      items: const [
        BottomNavigationBarItem(
          activeIcon: Icon(FontAwesomeIcons.house),
          icon: Icon(
            Icons.house,
            size: 20,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(FontAwesomeIcons.plus),
          icon: Icon(
            FontAwesomeIcons.plus,
            size: 20,
          ),
          label: "Add Numbers",
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(FontAwesomeIcons.user),
          icon: Icon(
            FontAwesomeIcons.user,
            size: 20,
          ),
          label: "Profile",
        ),
      ],
      fixedColor: Colors.amber,
      onTap: (int idx) {
        switch (idx) {
          case 0:
            break;
          case 1:
            Navigator.pushNamed(context, '/newentry');
            break;
          case 2:
            Navigator.pushNamed(context, '/home');
            break;
        }
      },
    );
  }
}
