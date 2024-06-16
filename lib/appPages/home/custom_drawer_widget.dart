import 'package:flutter/material.dart';
import 'package:online_reservations_for_sports/appPages/availability/availability_check_page.dart';
import 'package:online_reservations_for_sports/appPages/bookingHistroy/booking_history_page.dart';
import 'package:online_reservations_for_sports/appPages/home/homePage.dart';
import 'package:online_reservations_for_sports/appPages/reservations/payment.dart';
import 'package:online_reservations_for_sports/colors/colors.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: DarkColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text('Peter Anderson', style: TextStyle(color: WhiteColor, fontWeight: FontWeight.bold),),
              accountEmail: Text('peteranderson@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  'G',
                  style: TextStyle(fontSize: 40.0),
                ),
              ),

              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/badminton home page.jpg',),
                  fit:BoxFit.fill,
                )
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: WhiteColor,),
              title: const Text('Home'),
              titleTextStyle: const TextStyle(color: WhiteColor),
              onTap: () {
                Navigator.pushNamed(context, HomePage.name);
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today,color: WhiteColor),
              title: const Text('Calendar'),
              titleTextStyle: const TextStyle(color: WhiteColor),
              onTap: () {
                  Navigator.pushNamed(context, AvailabilityCheckPage.name);
              },
            ),
            ListTile(
              leading: const Icon(Icons.payment,color: WhiteColor,),
              title: const Text('Payments'),
              titleTextStyle: const TextStyle(color: WhiteColor),
              onTap: () {
                Navigator.pushNamed(context, PaymentPortal.name);
              },
            ),
            ListTile(
              leading: const Icon(Icons.history,color: WhiteColor,),
              title: const Text('Booking History'),
              titleTextStyle: const TextStyle(color: WhiteColor),
              onTap: () {
                Navigator.pushNamed(context, BookingPage.name);
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail,color: WhiteColor,),
              title: const Text('Contact Us'),
              titleTextStyle: const TextStyle(color: WhiteColor),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
