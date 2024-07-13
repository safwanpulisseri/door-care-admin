import 'package:doorcareadmin/core/util/png_asset.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/color/app_color.dart';

class WorkerPage extends StatelessWidget {
  const WorkerPage({super.key});

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
          const Text(
            'Workers',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search Worker',
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
                  DataColumn(label: Text('Profile')),
                  DataColumn(label: Text('Email')),
                  DataColumn(label: Text('Location')),
                  DataColumn(label: Text('Service')),
                  DataColumn(label: Text('Experience')),
                  DataColumn(label: Text('Created At')),
                  DataColumn(label: Text('Action')),
                ],
                rows: List.generate(
                  5,
                  (index) => DataRow(
                    cells: [
                      const DataCell(
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage(AppPngPath.homeCleanOne),
                            ),
                            SizedBox(width: 8),
                            Text('John Doe'),
                          ],
                        ),
                      ),
                      const DataCell(Text('john.doe123@example.com')),
                      const DataCell(Text('Calicut')),
                      DataCell(
                          Text(index % 2 == 0 ? 'Plumber' : 'Electrician')),
                      DataCell(Text(index % 2 == 0 ? '2 years' : '5 years')),
                      const DataCell(Text('24-05-2024')),
                      const DataCell(
                        Row(
                          children: [
                            Icon(Icons.block, color: AppColor.toneSeven),
                            SizedBox(width: 8),
                            Icon(Icons.edit, color: AppColor.toneEight),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Show icon for mobile view or if DataTable is overflowing
          if (isOverflowing)
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
        ],
      ),
    );
  }
}
