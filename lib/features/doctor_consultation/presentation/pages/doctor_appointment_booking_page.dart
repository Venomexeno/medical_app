import 'package:flutter/material.dart';
import 'package:medical_app/features/doctor_consultation/presentation/widgets/doctor_appointment_booking_page_body.dart';

class DoctorAppointmentBookingPage extends StatelessWidget {
  const DoctorAppointmentBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DoctorAppointmentBookingPageBody(),
    );
  }
}
