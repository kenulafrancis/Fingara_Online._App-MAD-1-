import 'package:flutter/material.dart';
import 'package:online_reservations_for_sports/appPages/home/homePage.dart';
import 'package:online_reservations_for_sports/appPages/availability/availability_check_page.dart';
import 'package:online_reservations_for_sports/appPages/reservations/payment.dart';
import 'package:online_reservations_for_sports/appPages/bookingHistroy/booking_history_page.dart';
import 'package:online_reservations_for_sports/colors/colors.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({super.key});

  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(), // Ensure HomePage is only instantiated once
    const AvailabilityCheckPage(),
    PaymentPortal(),
    BookingPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color:DarkColor,),
          label: 'Home',

        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today, color: DarkColor,),
          label: 'Availability',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.payment,color: DarkColor,),
          label: 'Payment',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history,color:DarkColor),
          label: 'History',
        ),
      ],
    );
  }
}
