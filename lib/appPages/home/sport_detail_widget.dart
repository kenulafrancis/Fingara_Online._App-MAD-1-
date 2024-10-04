import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SportDetailPage extends StatefulWidget {
  final int facilityId;

  const SportDetailPage({super.key, required this.facilityId});

  @override
  _SportDetailPageState createState() => _SportDetailPageState();
}

class _SportDetailPageState extends State<SportDetailPage> {
  Map<String, dynamic>? facilityData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchFacilityDetails();
  }

  Future<void> fetchFacilityDetails() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:8000/api/facilities/${widget.facilityId}'));

    if (response.statusCode == 200) {
      setState(() {
        facilityData = json.decode(response.body);
        isLoading = false;
      });
    } else {
      // Handle the error
      setState(() {
        isLoading = false;
      });
      // Optionally, you could show an error message here
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Loading...'),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (facilityData == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Failed to load facility data.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(facilityData!['name'] ?? 'Facility Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (facilityData!['detailed_image_path'] != null)
              Image.network(facilityData!['detailed_image_path'], height: 200, width: double.infinity, fit: BoxFit.cover),
            const SizedBox(height: 16),
            Text(
              facilityData!['name'] ?? '',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(facilityData!['description'] ?? 'No description available'),
            const SizedBox(height: 16),
            if (facilityData!['detailed_description'] != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: facilityData!['detailed_description'].map<Widget>((desc) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          desc['label'] ?? '',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(desc['content'] ?? ''),
                      ],
                    ),
                  );
                }).toList(),
              ),
            const SizedBox(height: 16),
            if (facilityData!['rules_and_regulations'] != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rules and Regulations',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ...facilityData!['rules_and_regulations'].map<Widget>((rule) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Text('- ${rule['rule']}'),
                    );
                  }).toList(),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
