import 'package:flutter/material.dart';
import 'package:online_reservations_for_sports/appPages/home/sport_detail_widget.dart';

class SportCard extends StatelessWidget {
  final int id;
  final String title;
  final String imagePath;
  final String description;

  const SportCard({super.key,
    required this.id,
    required this.title,
    required this.imagePath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SportDetailPage(facilityId: id),
          ),
        );
      },
      child: Card(
        elevation: 4.0,
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          children: [
            Image.asset(imagePath, fit: BoxFit.cover, height: 150.0, width: double.infinity),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                  Text(description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
