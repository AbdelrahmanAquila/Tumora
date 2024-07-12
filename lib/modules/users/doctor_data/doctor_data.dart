import 'package:flutter/material.dart';
import 'package:tumora/modules/users/bookin_screen/booking_screen.dart';
import 'package:tumora/shared/components.dart';

class DoctorData extends StatefulWidget {
  const DoctorData({super.key});

  @override
  State<DoctorData> createState() => _DoctorDataState();
}

class _DoctorDataState extends State<DoctorData> {
  DateTime today = DateTime.now();
  void onDaySelected(DateTime day, DateTime focusDay) {
    setState(() {
      today = day;
      print(today.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // iconTheme: IconThemeData(color: ColorManager.white),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Icon(Icons.favorite),
            )
          ],
          // backgroundColor: ColorManager.primary,`
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(right: 20.0, left: 20, top: 20, bottom: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 65,
                backgroundImage: NetworkImage(
                    'https://img.freepik.com/free-photo/woman-doctor-wearing-lab-coat-with-stethoscope-isolated_1303-29791.jpg?size=626&ext=jpg&ga=GA1.1.2008272138.1720483200&semt=ais_hybrid'),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Dr/ Britny Spears',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                softWrap: true,
                textAlign: TextAlign.center,
                'Lorem ipsum dolor sit amet. Et fugiat dolor est voluptatum alias aut voluptas fugiat cum ipsa quisquam. ',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Works At Shifa\' hospital',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(),
              Row(
                children: [
                  const Flexible(
                    child: Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      'Location In details Ex Wall ST 123467890',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.location_pin,
                        size: 34,
                      ))
                ],
              ),
              const Spacer(),
              DefultButton(
                  onpressed: () => navigateTo(context, const BookingScreen()),
                  text: 'Book An Oppointment')
            ],
          ),
        ));
  }
}
