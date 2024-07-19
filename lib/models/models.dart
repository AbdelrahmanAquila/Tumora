import 'package:intl/intl.dart';

class DoctorWithAppointments {
  int doctor_id;
  String firstname;
  String? qualification;
  String? specialization;
  int? experience;
  String email;
  int phone;
  Map<String, String> workingHours;
  List<Appointment>? todayAppointments;
  List<Appointment>? FutureAppointments;
  List<Appointment>? PastAppointments;
  List<Slot>? activeSlots;
  List<Slot>? futureSlots;

  DoctorWithAppointments(
      {required this.doctor_id,
      required this.firstname,
      this.experience,
      required this.email,
      required this.phone,
      required this.workingHours,
      this.todayAppointments,
      this.activeSlots,
      this.futureSlots,
      this.qualification,
      this.specialization,
      this.FutureAppointments,
      this.PastAppointments});

  factory DoctorWithAppointments.fromJson(Map<String, dynamic> json) {
    List<Appointment> todayappointmentsList = [];
    if (json['todayAppointments'] != null) {
      todayappointmentsList = List<Appointment>.from(json['todayAppointments']
          .map((appointment) => Appointment.fromJson(appointment)));
    }
    List<Appointment> futureAppointmentsList = [];
    if (json['todayAppointments'] != null) {
      futureAppointmentsList = List<Appointment>.from(json['futureAppointments']
          .map((appointment) => Appointment.fromJson(appointment)));
    }
    List<Appointment> pastAppointmentsList = [];
    if (json['todayAppointments'] != null) {
      pastAppointmentsList = List<Appointment>.from(json['pastAppointments']
          .map((appointment) => Appointment.fromJson(appointment)));
    }

    List<Slot> activeSlotsList = [];
    if (json['activeSlots'] != null) {
      activeSlotsList = List<Slot>.from(
          json['activeSlots'].map((slot) => Slot.fromJson(slot)));
    }

    List<Slot> futureSlotsList = [];
    if (json['futureSlots'] != null) {
      futureSlotsList = List<Slot>.from(
          json['futureSlots'].map((slot) => Slot.fromJson(slot)));
    }

    return DoctorWithAppointments(
      doctor_id: json['doctor_id'],
      firstname: json['firstname'],
      qualification: json['qualification'],
      specialization: json['specialization'],
      experience: json['experience'],
      email: json['email'],
      phone: json['phone'],
      workingHours: Map<String, String>.from(json['working_hours']),
      todayAppointments: todayappointmentsList,
      FutureAppointments: futureAppointmentsList,
      PastAppointments: pastAppointmentsList,
      activeSlots: activeSlotsList,
      futureSlots: futureSlotsList,
    );
  }
}

class Appointment {
  int appointmentId;
  int doctorId;
  int patientId;
  String appointmentDate;
  String startTime;
  String endTime;
  String status;
  String type;
  String notes;
  String firstname;
  String email;
  String phoneNumber;

  Appointment({
    required this.appointmentId,
    required this.doctorId,
    required this.patientId,
    required this.appointmentDate,
    required this.startTime,
    required this.endTime,
    required this.status,
    required this.type,
    required this.notes,
    required this.firstname,
    required this.email,
    required this.phoneNumber,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      appointmentId: json['appointment_id'],
      doctorId: json['doctor_id'],
      patientId: json['patient_id'],
      appointmentDate: json['appointment_date'],
      startTime: formatTime(json['start_time']),
      endTime: formatTime(json['end_time']),
      status: json['status'],
      type: json['type'],
      notes: json['notes'],
      firstname: json['firstname'],
      email: json['email'],
      phoneNumber: json['phonenumber'],
    );
  }
}

class Slot {
  int slotId;
  int doctorId;
  String date;
  String startTime;
  String endTime;
  bool isAvailable;
  List<String> availableDays;

  Slot({
    required this.slotId,
    required this.doctorId,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.isAvailable,
    required this.availableDays,
  });

  factory Slot.fromJson(Map<String, dynamic> json) {
    return Slot(
      slotId: json['slot_id'],
      doctorId: json['doctor_id'],
      date: json['date'],
      startTime: formatTime(json['start_time']),
      endTime: formatTime(json['end_time']),
      isAvailable: json['is_available'],
      availableDays: List<String>.from(json['available_days']['days']),
    );
  }
}

String formatTime(String time) {
  final inputFormat = DateFormat('HH:mm:ss');
  final outputFormat = DateFormat('h:mm a');
  final dateTime = inputFormat.parse(time);
  return outputFormat.format(dateTime);
}

String formatDateString(String dateString) {
  final DateTime parsedDate = DateTime.parse(dateString);
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  return formatter.format(parsedDate);
}
