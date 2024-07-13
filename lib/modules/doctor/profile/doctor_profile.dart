import 'package:flutter/material.dart';
import 'package:tumora/shared/color_manager.dart';

class DoctorProfileScreen extends StatefulWidget {
  const DoctorProfileScreen({super.key});

  @override
  State<DoctorProfileScreen> createState() => _DoctorProfileScreenState();
}

class _DoctorProfileScreenState extends State<DoctorProfileScreen> {
  List<Map<String, String>> patients = [
    {
      'imageUrl':
          'https://t4.ftcdn.net/jpg/00/65/77/27/360_F_65772719_A1UV5kLi5nCEWI0BNLLiFaBPEkUbv5Fv.jpg',
      'patientName': 'Mohammed Shrief',
      'patientTime': '4:00 PM',
    },
    {
      'imageUrl':
          'https://t4.ftcdn.net/jpg/00/65/77/27/360_F_65772719_A1UV5kLi5nCEWI0BNLLiFaBPEkUbv5Fv.jpg',
      'patientName': 'Abdelrahman Aquila',
      'patientTime': '4:30 PM',
    },
    {
      'imageUrl':
          'https://t4.ftcdn.net/jpg/00/65/77/27/360_F_65772719_A1UV5kLi5nCEWI0BNLLiFaBPEkUbv5Fv.jpg',
      'patientName': 'Lorem Ipsum',
      'patientTime': '5:00 PM',
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
        backgroundColor: ColorManager.primary,
        body: Container(
            color: ColorManager.primary,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 52,
                          child: CircleAvatar(
                            radius: 50,
                            //todo change with person image from api
                            foregroundImage: NetworkImage(
                                'https://play-lh.googleusercontent.com/OXuVASKXgBfduPKZmKgj3uirM2FdeiJS_e-VcqslCJ3xwnO1xpPrmx8cYpfj_9ZVgVg'),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //todo add name
                            Text(
                              'User Name',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: ColorManager.white),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            //todo add id
                            Text(
                              'ID #123456789',
                              style: TextStyle(
                                  fontSize: 18, color: ColorManager.white),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 30.0,
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "Today's Oppointments",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Flexible(
                          child: ListView.separated(
                            padding: const EdgeInsets.only(
                                top: 10, left: 10, right: 10, bottom: 10),
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: patients.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                height: 15,
                              );
                            },
                            itemBuilder: (BuildContext context, int index) {
                              return PatientCardBuilder(
                                screenWidth: screenWidth,
                                startAnimation: startAnimation,
                                index: patients.length,
                                ontap: () {
                                  setState(() {
                                    patients.removeAt(
                                      index,
                                    );
                                    Navigator.pop(context);
                                  });
                                },
                                imageUrl: patients[index]['imageUrl'],
                                patientName: patients[index]['patientName'],
                                patientTime: patients[index]['patientTime'],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ])));
  }
}

// ignore: must_be_immutable
class PatientCardBuilder extends StatelessWidget {
  final bool startAnimation;
  final double screenWidth;
  final int index;
  final String? imageUrl;
  final String? patientName;
  final String? patientTime;
  void Function()? ontap;
  PatientCardBuilder(
      {super.key,
      required this.screenWidth,
      required this.index,
      required this.imageUrl,
      required this.patientName,
      required this.patientTime,
      required this.startAnimation,
      this.ontap});

  @override
  Widget build(BuildContext context) {
    void showConfirmationDialog(int index) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirm Canclation'),
            content:
                const Text('Are you sure you want to Cancel This Oppointment'),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'No',
                  style: TextStyle(color: ColorManager.primary),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                  onPressed: ontap,
                  child: const Text(
                    'Yes',
                    style: TextStyle(color: Colors.red),
                  )),
            ],
          );
        },
      );
    }

    return AnimatedContainer(
      transform:
          Matrix4.translationValues(startAnimation ? 0 : screenWidth, 0, 0),
      curve: Curves.easeInOutBack,
      duration: Duration(milliseconds: 300 + (index * 100)),
      margin: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              spreadRadius: 1,
              color: ColorManager.greydark,
              blurRadius: 5,
              offset: const Offset(-3, 3))
        ],
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        color: ColorManager.secondary,
      ),
      height: 75,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(
                width: 75,
                fit: BoxFit.fitHeight,
                image: NetworkImage(imageUrl!)),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //todo doc name and time from api

                    Text(
                      maxLines: 1,
                      overflow: TextOverflow.visible,
                      patientName!,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      maxLines: 1,
                      overflow: TextOverflow.visible,
                      patientTime!,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                showConfirmationDialog(index);
              },
            )
          ],
        ),
      ),
    );
  }
}
