import 'package:flutter/material.dart';
import 'package:online_reservations_for_sports/colors/colors.dart';
import 'package:online_reservations_for_sports/components/battery_percentage_widget.dart';  // Import the Battery Percentage Widget

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double deviceHeight;

  const CustomAppBar({super.key, required this.deviceHeight});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Fingara Sports Booking',
        style: TextStyle(color: WhiteColor),
      ),
      centerTitle: true,
      actions: [
        BatteryPercentageWidget(),  // Add the Battery Percentage Widget here
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {},
          color: WhiteColor,
        ),
      ],
      backgroundColor: Colors.black,
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: const Icon(Icons.menu),
        color: WhiteColor,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.0),
          bottomRight: Radius.circular(25.0),
        ),
      ),
      toolbarHeight: deviceHeight * 0.1,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(deviceHeight * 0.1);
}
