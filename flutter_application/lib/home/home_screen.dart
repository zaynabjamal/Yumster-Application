import 'package:flutter/material.dart';
import 'package:flutter_application/favorite/save_page.dart';
import 'package:flutter_application/home/home_body.dart';
import 'package:flutter_application/profilePage/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> screens = [
    const SavedPage(),
    const HomeBody(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffFCFCF8),
        body: screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xffFFF5E5),
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xffFE9801),
          unselectedItemColor: const Color(0xffB0AA86),
          selectedIconTheme: const IconThemeData(size: 45, fill: 0.0),
          iconSize: 40,
          onTap: _navigateBottomBar,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: _selectedIndex == 0
                  ? const Icon(Icons.bookmark)
                  : const Icon(Icons.bookmark_border),
              label: '',
            ),
            BottomNavigationBarItem(
                icon: _selectedIndex == 1
                    ? const Icon(Icons.home)
                    : const Icon(Icons.home_outlined),
                label: ''),
            BottomNavigationBarItem(
                icon: _selectedIndex == 2
                    ? const Icon(Icons.person)
                    : const Icon(Icons.person_outline_outlined),
                label: ''),
          ],
        ),
      ),
    );
  }
}
