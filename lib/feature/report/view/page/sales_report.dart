import 'package:doorcareadmin/core/theme/color/app_color.dart';
import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get the screen width
    final screenWidth = MediaQuery.of(context).size.width;
    final isOverflowing = screenWidth <
        1280; // Check if the screen width is less than the threshold

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Sales Report',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  // Handle date selection logic here
                },
                icon: const Icon(Icons.date_range),
                label: const Text('Select Date'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search Sales',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Booking Id')),
                  DataColumn(label: Text('Services')),
                  DataColumn(label: Text('Users')),
                  DataColumn(label: Text('Workers')),
                  DataColumn(label: Text('Date')),
                  DataColumn(label: Text('Transaction Id')),
                  DataColumn(label: Text('Amount')),
                ],
                rows: List.generate(
                  5,
                  (index) => DataRow(
                    cells: [
                      DataCell(
                        Text(index % 2 == 0 ? 'BB461426' : 'AFGT1426'),
                      ),
                      DataCell(Text(index % 2 == 0 ? 'Electrical' : 'Plumber')),
                      const DataCell(Text('Safwan Pulisseri')),
                      const DataCell(Text('Adhil Ali')),
                      const DataCell(Text('24-05-2024')),
                      const DataCell(Text('pi_3PPGH9SCq8UdAofe0IrlyvlT')),
                      const DataCell(Text('275')),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (isOverflowing) // Show icon for mobile view or if DataTable is overflowing
            Container(
              padding: const EdgeInsets.only(top: 16.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_forward_ios, color: AppColor.primary),
                  SizedBox(width: 8),
                  Text(
                    'Swipe to see more',
                    style: TextStyle(
                      color: AppColor.primary,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          // const SizedBox(height: 16),
          // // Pagination controls
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     IconButton(
          //       icon: const Icon(Icons.arrow_back),
          //       onPressed: () {
          //         // Handle previous page action
          //       },
          //     ),
          //     const SizedBox(width: 8),
          //     TextButton(
          //       onPressed: () {
          //         // Handle page 1 action
          //       },
          //       style: TextButton.styleFrom(
          //         foregroundColor: Colors.white,
          //         backgroundColor: Colors.blue,
          //         shape: const CircleBorder(),
          //       ),
          //       child: const Text('1'),
          //     ),
          //     const SizedBox(width: 8),
          //     TextButton(
          //       onPressed: () {
          //         // Handle page 2 action
          //       },
          //       style: TextButton.styleFrom(
          //         foregroundColor: Colors.blue,
          //         backgroundColor: Colors.white,
          //         shape: const CircleBorder(),
          //       ),
          //       child: const Text('2'),
          //     ),
          //     const SizedBox(width: 8),
          //     TextButton(
          //       onPressed: () {
          //         // Handle page 3 action
          //       },
          //       style: TextButton.styleFrom(
          //         foregroundColor: Colors.blue,
          //         backgroundColor: Colors.white,
          //         shape: const CircleBorder(),
          //       ),
          //       child: const Text('3'),
          //     ),
          //     const SizedBox(width: 8),
          //     IconButton(
          //       icon: const Icon(Icons.arrow_forward),
          //       onPressed: () {
          //         // Handle next page action
          //       },
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
