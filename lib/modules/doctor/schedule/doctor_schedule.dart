import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tumora/shared/color_manager.dart';
import 'package:tumora/shared/components.dart';

class DoctorScheduleScreen extends StatefulWidget {
  const DoctorScheduleScreen({super.key});

  @override
  State<DoctorScheduleScreen> createState() => _DoctorScheduleScreenState();
}

class _DoctorScheduleScreenState extends State<DoctorScheduleScreen> {
  final _formKey = GlobalKey<FormState>();
  String? dayOrNight;
  CalendarFormat _calenderFormat = CalendarFormat.month;
  DateTime _currentDay = DateTime.now();
  DateTime _focusDay = DateTime.now();
  int? bookingSlot;
  int? _currentIndex;
  bool _isHoliday = false;
  bool _daySelected = false;
  bool _timeSelcted = false;

  DateTime startHour = DateTime.now();
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(startHour),
    );
    setState(() {
      startHour = DateTime(
        startHour.year,
        startHour.month,
        startHour.day,
        picked!.hour,
        picked.minute,
      );
    });
  }

  TextEditingController controller = TextEditingController();
  void _showTimesSettings(context) {
    bool tempValue = is30Min;
    showDialog(
      context: context,
      builder: (context) {
        return Form(
          key: _formKey,
          child: AlertDialog(
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        workingHours = int.parse(controller.text);
                        is30Min = tempValue;
                        Navigator.of(context).pop();
                      });
                    }
                  },
                  child: Text(
                    'Confirm',
                    style: TextStyle(color: ColorManager.primary),
                  )),
            ],
            title: const Text('Set Working Hours'),
            content: StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TFF(
                      controller: controller,
                      label: 'Hours?',
                      validationMassage: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Working Hours';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                    ),
                    Row(
                      children: [
                        Radio<bool>(
                          activeColor: ColorManager.primary,
                          value: true,
                          groupValue: tempValue,
                          onChanged: (value) {
                            setState(
                              () {
                                tempValue = value ?? true;
                              },
                            );

                            // Default to true if value is null
                          },
                        ),
                        const Text('30 min'),
                        Radio<bool>(
                          activeColor: ColorManager.primary,

                          // toggleable: true,
                          value: false,
                          groupValue: tempValue,
                          onChanged: (value) {
                            setState(
                              () {
                                tempValue = value ?? false;
                              },
                            );
                          },
                        ),
                        const Text('1 Hour'),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  int workingHours = 3;
  bool is30Min = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    _showTimesSettings(context);
                  });
                },
                icon: const Icon(Icons.edit)),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => setState(() {
                _selectTime(context);
              }),
            )
          ],
          title: const Text('Appointment'),
          centerTitle: true,
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(children: [
                // TimePickerDialog(
                //   initialTime: TimeOfDay.now(),
                // ),
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
                      final time = startHour.add(Duration(minutes: index * 30));
                      final formattedTime = DateFormat('h:mm a').format(time);
                      return InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            //todo send time to dp
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
                              formattedTime,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: _currentIndex == index
                                      ? Colors.white
                                      : null),
                            )),
                      );
                    }, childCount: is30Min ? workingHours * 2 : workingHours),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, childAspectRatio: 1.5)),
            // SliverToBoxAdapter(
            //   child: Container(
            //     padding:
            //         const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            //     child: DefultButton(
            //       // width: double.infinity,
            //       text: 'Confirm Appointment',
            //       onpressed: () {
            //         //convert date/day/time into string first
            //         // final getDate = DateConverted.getDate(_currentDay);
            //         // final getDay = DateConverted.getDay(_currentDay.weekday);
            //         // final getTime = DateConverted.getTime(_currentIndex!);

            //         // final booking = await DioProvider().bookAppointment(
            //         //     getDate, getDay, getTime, doctor['doctor_id'], token!);

            //         //if booking return status code 200, then redirect to success booking page

            //         // if (booking == 200) {
            //         //   MyApp.navigatorKey.currentState!
            //         //       .pushNamed('success_booking');
            //         // }
            //       },
            //     ),
            //   ),
            // ),
          ],
        ));
  }

  Widget _tableCalender() {
    return TableCalendar(
      rowHeight: 48,
      calendarFormat: CalendarFormat.month,
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
