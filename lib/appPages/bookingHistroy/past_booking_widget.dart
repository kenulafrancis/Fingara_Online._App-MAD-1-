import 'package:flutter/material.dart';

class PastBookingsTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Past Bookings',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Booking Date')),
                    DataColumn(label: Text('Start Time')),
                    DataColumn(label: Text('End Time')),
                    DataColumn(label: Text('Court Number')),
                    DataColumn(label: Text('Payment Status')),
                  ],
                  rows: List<DataRow>.generate(
                    5,
                        (index) => const DataRow(
                      cells: [
                        DataCell(Text('2024.05.15')),
                        DataCell(Text('4:00 PM')),
                        DataCell(Text('5:00 PM')),
                        DataCell(Text('03')),
                        DataCell(Text('Done')),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
