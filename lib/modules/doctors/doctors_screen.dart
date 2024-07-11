// import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tumora/modules/doctor_data/doctor_data.dart';
import 'package:tumora/shared/color_manager.dart';
import 'package:tumora/shared/components.dart';

class DoctorsScreen extends StatefulWidget {
  const DoctorsScreen({super.key});

  @override
  State<DoctorsScreen> createState() => _DoctorsScreenState();
}

class _DoctorsScreenState extends State<DoctorsScreen> {
  List list = [1, 2, 3, 4, 5];
  bool startAnimation = false;
  double screenWidth = 0;

  @override
  void initState() {
    // TODO: implement initState
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
        itemCount: 15,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 20,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return doctorListItem(context, index);
        },
      ),
    ));
  }

  Widget doctorListItem(context, int index) {
    return GestureDetector(
      onTap: () {
        navigateTo(context, const DoctorData());
      },
      child: AnimatedContainer(
        transform:
            Matrix4.translationValues(startAnimation ? 0 : screenWidth, 0, 0),
        curve: Curves.easeInOut,
        duration: Duration(milliseconds: 300 + (index * 300)),
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
          // backgroundBlendMode: BlendMode.hardLight,
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          color: ColorManager.secondary,
        ),
        height: 100,
        width: double.infinity,
        child: const Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image(
                  width: 100,
                  fit: BoxFit.fitHeight,
                  image: NetworkImage(
                      'https://play-lh.googleusercontent.com/OXuVASKXgBfduPKZmKgj3uirM2FdeiJS_e-VcqslCJ3xwnO1xpPrmx8cYpfj_9ZVgVg')),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    // textBaseline: TextBaseline.alphabetic,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //todo doc name and time from api

                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.visible,
                        'Dr. Doctor_Name',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.visible,
                        'Adress 123 building ',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      //stars rating row
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          Icon(
                            Icons.star_border,
                          ),
                          Icon(
                            Icons.star_border,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Icon(
                Icons.more_vert,
                size: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class DocCardBuilder extends StatelessWidget {
//   const DocCardBuilder({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return
//   }

