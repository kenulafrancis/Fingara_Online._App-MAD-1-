import 'package:flutter/material.dart';
import 'package:online_reservations_for_sports/appPages/availability/availability_check_page.dart';
import 'package:online_reservations_for_sports/appPages/bookingHistroy/booking_history_page.dart';
import 'package:online_reservations_for_sports/appPages/home/home2.dart';
import 'package:online_reservations_for_sports/appPages/home/homePage.dart';
import 'package:online_reservations_for_sports/appPages/reservations/payment.dart';
import 'package:online_reservations_for_sports/colors/colors.dart';
import 'package:online_reservations_for_sports/services/phone_service.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneService = PhoneService("0112509676"); // Replace with your phone number

    return SafeArea(
      child: Drawer(
        backgroundColor: DarkColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text(
                'Peter Anderson',
                style: TextStyle(color: WhiteColor, fontWeight: FontWeight.bold),
              ),
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
                  image: AssetImage('assets/images/badminton home page.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: WhiteColor),
              title: const Text('Home',style:TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushNamed(context, HomePage.name);
              },
            ),
            ListTile(
              leading: const Icon(Icons.calendar_today, color: WhiteColor),
              title: const Text('Calendar', style:TextStyle(color: Colors.white),),
              onTap: () {
                Navigator.pushNamed(context, AvailabilityCheckPage.name);
              },
            ),
            ListTile(
              leading: const Icon(Icons.payment, color: WhiteColor),
              title: const Text('Payments', style:TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushNamed(context, PaymentPortal.name);
              },
            ),
            ListTile(
              leading: const Icon(Icons.history, color: WhiteColor),
              title: const Text('Booking History', style:TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushNamed(context, BookingPage.name);
              },
            ),
            ListTile(
              leading: const Icon(Icons.phone, color: WhiteColor),
              title: const Text('Contact Us', style:TextStyle(color: Colors.white)),
              onTap: () {
                phoneService.dialPhoneNumber();
              },
            ),
            ListTile(
              leading: const Icon(Icons.maps_home_work, color: WhiteColor),
              title: const Text('Find US',style:TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pushNamed(context, Home2Page.name);
              },
            ),
          ],
        ),
      ),
    );
  }
}
