import 'package:flutter/material.dart';
import 'package:online_reservations_for_sports/appPages/bookingHistroy/active_booking_widget.dart';
import 'package:online_reservations_for_sports/appPages/bookingHistroy/past_booking_widget.dart';
import 'package:online_reservations_for_sports/colors/colors.dart';

class BookingPage extends StatefulWidget {
  static final String name = 'booking';

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final bool isLandscape = width > height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookings', style: TextStyle(color: WhiteColor)),
        centerTitle: true,
        backgroundColor: DarkColor,
        iconTheme: const IconThemeData(color: WhiteColor),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25.0),
            bottomLeft: Radius.circular(25.0),
          ),
        ),
        toolbarHeight: isLandscape ? height * 0.15 : height * 0.1,
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            const Tab(text: 'ACTIVE BOOKINGS'),
            const Tab(text: 'PAST BOOKINGS'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ActiveBookingsTable(),
          PastBookingsTable(),
        ],
      ),
    );
  }
}
