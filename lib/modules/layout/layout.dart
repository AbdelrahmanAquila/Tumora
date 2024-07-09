import 'package:flutter/material.dart';
import 'package:tumora/modules/cura/cura_screen.dart';
import 'package:tumora/modules/doctors/doctors_screen.dart';
import 'package:tumora/modules/profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;
  List<Widget?> screens = [
    const ProfileScreen(),
    const DoctorsScreen(),
    const CuraChat(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[_index],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _index,
            onTap: (value) {
              setState(() {
                _index = value;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded),
                label: 'profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.perm_contact_calendar_rounded),
                label: 'Doctors',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat),
                label: 'Cura',
              )
            ]));
  }
}
