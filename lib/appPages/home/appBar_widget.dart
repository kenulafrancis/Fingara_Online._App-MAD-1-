import 'package:flutter/material.dart';
import 'package:online_reservations_for_sports/colors/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double deviceHeight;

  const CustomAppBar({required this.deviceHeight});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Fingara Sports Booking', style: TextStyle(color: WhiteColor)),
      centerTitle: true,
      actions: [
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
