import 'package:flutter/material.dart';

import '../../app_theme.dart';
import '../users/users_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = const [UsersPage()];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages.elementAt(_selectedIndex),
        extendBody: true,
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(40),
            topLeft: Radius.circular(40),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.purple,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline), label: "Usuários"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.info_outline), label: "Sobre"),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: AppTheme.primaryColorLight,
            unselectedItemColor: Colors.white,
            showSelectedLabels: true,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            onTap: (value) {
              _selectedIndex = value;
              setState(() {});
            },
          ),
        ));
  }
}
