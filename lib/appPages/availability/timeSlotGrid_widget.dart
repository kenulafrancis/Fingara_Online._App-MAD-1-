import 'package:flutter/material.dart';
import 'package:online_reservations_for_sports/colors/colors.dart';

class TimeSlotsGrid extends StatelessWidget {
  final String? selectedTimeSlot;
  final ValueChanged<String> onTimeSlotSelected;

  const TimeSlotsGrid({
    Key? key,
    required this.selectedTimeSlot,
    required this.onTimeSlotSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Check if the current theme is dark mode
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    List<String> timeSlots = [
      '6:00 AM - 7:00 AM', '7:00 AM - 8:00 AM', '8:00 AM - 9:00 AM',
      '9:00 AM - 10:00 AM', '10:00 AM - 11:00 AM', '11:00 AM - 12:00 PM',
      '12:00 PM - 1:00 PM', '1:00 PM - 2:00 PM', '2:00 PM - 3:00 PM',
      '3:00 PM - 4:00 PM', '4:00 PM - 5:00 PM', '5:00 PM - 6:00 PM',
      '6:00 PM - 7:00 PM', '7:00 PM - 8:00 PM', '8:00 PM - 9:00 PM',
      '9:00 PM - 10:00 PM', '10:00 PM - 11:00 PM'
    ];

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: timeSlots.length,
      itemBuilder: (context, index) {
        return ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              selectedTimeSlot == timeSlots[index]
                  ? PrimaryColor
                  : isDarkMode ? Colors.white : SecondaryColor,
            ),
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(8.0)),
            textStyle: MaterialStateProperty.all<TextStyle>(
              TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.black : Colors.white,
              ),
            ),
          ),
          onPressed: () {
            onTimeSlotSelected(timeSlots[index]);
          },
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(timeSlots[index]),
          ),
        );
      },
    );
  }
}
