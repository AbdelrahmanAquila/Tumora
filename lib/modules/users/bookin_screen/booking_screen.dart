import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tumora/shared/color_manager.dart';
import 'package:tumora/shared/components.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  CalendarFormat _calenderFormat = CalendarFormat.month;
  DateTime _currentDay = DateTime.now();
  DateTime _focusDay = DateTime.now();
  int? _currentIndex;
  bool _isHoliday = false;
  bool _daySelected = false;
  bool _timeSelcted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Appointment'),
          centerTitle: true,
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(children: [
                _tableCalender(),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Select Consultion Time',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ]),
            ),
            _isHoliday
                ? SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 30),
                      alignment: Alignment.center,
                      child: const Text(
                        textAlign: TextAlign.center,
                        'Doctor Isnt Avilable During Weekends, Please try Choose another date',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  )
                : SliverGrid(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            _currentIndex = index;
                            _timeSelcted = true;
                          });
                        },
                        child: Container(
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: _currentIndex == index
                                      ? Colors.white
                                      : Colors.black),
                              borderRadius: BorderRadius.circular(15),
                              color: _currentIndex == index
                                  ? ColorManager.primary
                                  : null,
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              '${index + 9}:00 ${index + 9 > 11 ? "PM" : "AM"} ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: _currentIndex == index
                                      ? Colors.white
                                      : null),
                            )),
                      );
                    }, childCount: 7),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, childAspectRatio: 1.5)),
            SliverToBoxAdapter(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: DefultButton(
                  // width: double.infinity,
                  text: 'Confirm Appointment',
                  onpressed: () {
                    //convert date/day/time into string first
                    // final getDate = DateConverted.getDate(_currentDay);
                    // final getDay = DateConverted.getDay(_currentDay.weekday);
                    // final getTime = DateConverted.getTime(_currentIndex!);

                    // final booking = await DioProvider().bookAppointment(
                    //     getDate, getDay, getTime, doctor['doctor_id'], token!);

                    //if booking return status code 200, then redirect to success booking page

                    // if (booking == 200) {
                    //   MyApp.navigatorKey.currentState!
                    //       .pushNamed('success_booking');
                    // }
                  },
                ),
              ),
            ),
          ],
        ));
  }

  Widget _tableCalender() {
    return TableCalendar(
      rowHeight: 48,
      calendarFormat: _calenderFormat,
      availableCalendarFormats: const {CalendarFormat.month: 'Month'},
      onFormatChanged: (format) {
        setState(() {
          _calenderFormat = format;
        });
      },
      calendarStyle: CalendarStyle(
          todayDecoration: BoxDecoration(
              color: ColorManager.primary, shape: BoxShape.circle)),
      headerStyle:
          const HeaderStyle(formatButtonVisible: false, titleCentered: true),
      currentDay: _currentDay,
      focusedDay: _focusDay,
      firstDay: DateTime.now(),
      lastDay: DateTime.utc(2024, 12, 30),
      onDaySelected: (selectedDay, focusedDay) {
        setState(() {
          _currentDay = selectedDay;
          _focusDay = focusedDay;
          _daySelected = true;

          // Checking For Holidays
          if (selectedDay.weekday == 6 || selectedDay.weekday == 7) {
            _isHoliday = true;
            _currentIndex = null;
            _timeSelcted = false;
          } else {
            _isHoliday = false;
          }
        });
      },
    );
  }
}
