import 'package:flutter/material.dart';
import 'package:online_reservations_for_sports/appPages/availability/availability_check_page.dart';
import 'package:online_reservations_for_sports/appPages/home/appBar_widget.dart';
import 'package:online_reservations_for_sports/appPages/home/custom_drawer_widget.dart';
import 'package:online_reservations_for_sports/colors/colors.dart';
import 'package:online_reservations_for_sports/appPages/home/sport_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static const String name = 'home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    return Scaffold(
      appBar: CustomAppBar(deviceHeight: deviceHeight),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: isPortrait
            ? ListView(
          children: _buildSportCards(),
        )
            : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _buildSportCards(),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, AvailabilityCheckPage.name);
        },
        label: const Text('Reserve Now', style: TextStyle(color: WhiteColor)),
        icon: const Icon(Icons.add, color: WhiteColor),
        backgroundColor: DarkColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  List<Widget> _buildSportCards() {
    return [
      const Expanded(
        child: SportCard(
          title: 'Tennis',
          imagePath: 'assets/images/tennis2.jpg',
          description: 'Play tennis with us!',
        ),
      ),
      const SizedBox(width: 10), // Add some spacing between cards in landscape mode
      const Expanded(
        child: SportCard(
          title: 'Badminton',
          imagePath: 'assets/images/badminton2.jpg',
          description: 'Join our badminton games!',
        ),
      ),
      const SizedBox(width: 10), // Add some spacing between cards in landscape mode
      const Expanded(
        child: SportCard(
          title: 'Squash',
          imagePath: 'assets/images/squash2.jpg',
          description: 'Enjoy squash at our club!',
        ),
      ),
    ];
  }
}


