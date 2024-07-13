import 'package:flutter/material.dart';
import 'package:tumora/modules/doctor/diagnosis/diagnosis_screen.dart';
import 'package:tumora/modules/doctor/profile/doctor_profile.dart';
import 'package:tumora/modules/doctor/schedule/doctor_schedule.dart';

class DoctorHomeScreen extends StatefulWidget {
  const DoctorHomeScreen({super.key});

  @override
  State<DoctorHomeScreen> createState() => _DoctorHomeScreenState();
}

class _DoctorHomeScreenState extends State<DoctorHomeScreen> {
  int _index = 0;
  List<Widget?> screens = [
    const DoctorProfileScreen(),
    const DoctorScheduleScreen(),
    const DiagnosisScreen(),
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
                icon: Icon(Icons.calendar_month),
                label: 'Schedule',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.monitor_heart),
                label: 'Diagnosis',
              )
            ]));
  }
}
