// import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tumora/modules/users/doctor_data/doctor_data.dart';
import 'package:tumora/shared/components.dart';

class DoctorsScreen extends StatefulWidget {
  const DoctorsScreen({super.key});

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  List<Map<String, String>> doctors = [
    {
      'imageUrl':
          'https://play-lh.googleusercontent.com/OXuVASKXgBfduPKZmKgj3uirM2FdeiJS_e-VcqslCJ3xwnO1xpPrmx8cYpfj_9ZVgVg',
      'drName': 'Mohammed Shrief',
      'drMajor': 'Computer Scince',
    },
    {
      'imageUrl':
          'https://play-lh.googleusercontent.com/OXuVASKXgBfduPKZmKgj3uirM2FdeiJS_e-VcqslCJ3xwnO1xpPrmx8cYpfj_9ZVgVg',
      'drName': 'Abdelrahman Aquila',
      'drMajor': 'Flutter',
    },
    {
      'imageUrl':
          'https://play-lh.googleusercontent.com/OXuVASKXgBfduPKZmKgj3uirM2FdeiJS_e-VcqslCJ3xwnO1xpPrmx8cYpfj_9ZVgVg',
      'drName': 'Lorem Ipsum',
      'drMajor': 'Lorem Ipsum',
    }
  ];

  bool startAnimation = false;
  double screenWidth = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        setState(() {
          startAnimation = true;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Flexible(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: doctors.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 20,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return CardBuilder(
              ontap: () {
                navigateTo(context, const DoctorData());
              },
              screenWidth: screenWidth,
              index: index,
              imageUrl: doctors[index]['imageUrl'],
              drName: doctors[index]['drName'],
              drMajor: doctors[index]['drMajor'],
              startAnimation: startAnimation);
        },
      ),
    ));
  }
}


//