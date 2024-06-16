import 'package:flutter/material.dart';

class SportDetailPage extends StatelessWidget {
  final String title;

  const SportDetailPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('Details about $title'),
      ),
    );
  }
}
