// lib/appPages/home/home2.dart
import 'package:flutter/material.dart';
import 'package:online_reservations_for_sports/appPages/ui/map_screen.dart';
import 'package:online_reservations_for_sports/appPages/ui/weather_screen.dart';
import 'package:online_reservations_for_sports/colors/colors.dart';

class Home2Page extends StatefulWidget {
  static const String name = 'home2';

  const Home2Page({super.key});

  @override
  _Home2PageState createState() => _Home2PageState();
}

class _Home2PageState extends State<Home2Page> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const MapScreen(),     // Map screen
    const WeatherScreen(         // Weather screen with example coordinates
      latitude: 40.712776,
      longitude: -74.005974,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Us', style: TextStyle(color: WhiteColor)),
        centerTitle: true,
        backgroundColor: DarkColor,
        iconTheme: const IconThemeData(color: WhiteColor),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25.0),
            bottomLeft: Radius.circular(25.0),
          ),
        ),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: "Map",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            label: "Weather",
          ),
        ],
      ),
    );
  }
}
