import 'package:flutter/material.dart';
import 'package:online_reservations_for_sports/Themes/theme.dart';
import 'package:online_reservations_for_sports/appPages/Navigation/bottom_navigation_widget.dart';
import 'package:online_reservations_for_sports/appPages/availability/availability_check_page.dart';
import 'package:online_reservations_for_sports/appPages/bookingHistroy/booking_history_page.dart';
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
      home: const BottomNavigation(
        child: HomePage(),
      ),
      routes: {
        Welcome.name: (context) => Welcome(),
        Login.name: (context) => const Login(),
        HomePage.name: (context) => const HomePage(),
        AvailabilityCheckPage.name: (context) => const AvailabilityCheckPage(),
        PaymentPortal.name: (context) => PaymentPortal(),
        BookingPage.name: (context) => BookingPage(),
      },
    );
  }
}
