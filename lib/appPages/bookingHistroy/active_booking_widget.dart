import 'package:flutter/material.dart';

class ActiveBookingsTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Current Bookings',
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
                        DataCell(Text('2024.06.30')),
                        DataCell(Text('5:00 AM')),
                        DataCell(Text('6:00 AM')),
                        DataCell(Text('05')),
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
