import 'package:flutter/material.dart';

class SportDropdown extends StatelessWidget {
  final String selectedSport;
  final ValueChanged<String?> onChanged;

  const SportDropdown({
    Key? key,
    required this.selectedSport,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedSport,
      items: <String>['Tennis', 'Badminton', 'Squash'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}
