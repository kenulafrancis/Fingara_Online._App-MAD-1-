import 'package:flutter/material.dart';

class PaymentMethodSelection extends StatefulWidget {
  @override
  _PaymentMethodSelectionState createState() => _PaymentMethodSelectionState();
}

class _PaymentMethodSelectionState extends State<PaymentMethodSelection> {
  String _selectedMethod = 'Credit Card';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Text('Credit Card'),
          leading: Radio<String>(
            value: 'Credit Card',
            groupValue: _selectedMethod,
            onChanged: (String? value) {
              setState(() {
                _selectedMethod = value!;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('PayPal'),
          leading: Radio<String>(
            value: 'PayPal',
            groupValue: _selectedMethod,
            onChanged: (String? value) {
              setState(() {
                _selectedMethod = value!;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Bank Transfer'),
          leading: Radio<String>(
            value: 'Bank Transfer',
            groupValue: _selectedMethod,
            onChanged: (String? value) {
              setState(() {
                _selectedMethod = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}
