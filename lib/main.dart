import 'package:flutter/material.dart';
import 'package:online_reservations_for_sports/Themes/theme.dart';
import 'package:online_reservations_for_sports/appPages/availability/availability_check_page.dart';
import 'package:online_reservations_for_sports/appPages/bookingHistroy/booking_history_page.dart';
import 'package:online_reservations_for_sports/appPages/home/home2.dart';
import 'package:online_reservations_for_sports/appPages/home/homePage.dart';
import 'package:online_reservations_for_sports/appPages/login/Login_Fingara.dart';
import 'package:online_reservations_for_sports/appPages/login/WelcomeBack.dart';
import 'package:online_reservations_for_sports/appPages/reservations/payment.dart';

void main() {
  runApp(const OnlineReservation());
}

class OnlineReservation extends StatelessWidget {
  const OnlineReservation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: Welcome.name,
      routes: {
        Welcome.name: (context) => const Welcome(),

        Login.name: (context) => const Login(),
        Home2Page.name: (context) => const Home2Page(),
        HomePage.name: (context) => const HomePage(),
        AvailabilityCheckPage.name: (context) => const AvailabilityCheckPage(),
        PaymentPortal.name: (context) => PaymentPortal(),
        BookingPage.name: (context) => BookingPage(),
      },
    );
  }
}
