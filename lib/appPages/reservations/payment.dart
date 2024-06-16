import 'package:flutter/material.dart';
import 'package:online_reservations_for_sports/appPages/home/homePage.dart';
import 'package:online_reservations_for_sports/appPages/reservations/booking_detail_widget.dart';
import 'package:online_reservations_for_sports/appPages/reservations/payment_input_widget.dart';
import 'package:online_reservations_for_sports/appPages/reservations/payment_method_widget.dart';
import 'package:online_reservations_for_sports/colors/colors.dart';

class PaymentPortal extends StatelessWidget {
  static const String name = 'payment';

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Portal', style: TextStyle(color: WhiteColor)),
        centerTitle: true,
        backgroundColor: DarkColor,
        iconTheme: const IconThemeData(color: WhiteColor),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25.0),
            bottomLeft: Radius.circular(25.0),
          ),
        ),
        toolbarHeight: height * 0.1,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Padding(
            padding: EdgeInsets.all(orientation == Orientation.landscape ? 50.0 : 30.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Booking Details',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    child: BookingDetails(),
                    width: double.infinity,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Payment Method',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  PaymentMethodSelection(),
                  const SizedBox(height: 20),
                  const Text(
                    'Payment Details',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  PaymentDetailsInput(),
                  const SizedBox(height: 30),
                  Center(
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          _showConfirmationDialog(context);
                        },
                        child: const Text('Confirm Payment'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Payment Confirmation'),
          content: const Text('Your payment has been successfully processed.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, HomePage.name);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
