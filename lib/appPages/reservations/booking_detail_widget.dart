import 'package:flutter/material.dart';

class BookingDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Facility: Soccer Field 1', style: TextStyle(fontSize: 16)),
          Text('Date: June 20, 2024', style: TextStyle(fontSize: 16)),
          Text('Time: 3:00 PM - 5:00 PM', style: TextStyle(fontSize: 16)),
          Text('Total Amount: Rs.5000', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
