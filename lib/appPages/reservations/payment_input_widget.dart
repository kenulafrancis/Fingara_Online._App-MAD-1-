import 'package:flutter/material.dart';

class PaymentDetailsInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Card Number',
          ),
        ),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Card Holder Name',
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Expiry Date',
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'CVV',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
