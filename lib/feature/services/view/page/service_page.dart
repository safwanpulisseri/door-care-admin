import 'package:doorcareadmin/core/theme/color/app_color.dart';
import 'package:doorcareadmin/core/util/png_asset.dart';
import 'package:flutter/material.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get the screen width
    final screenWidth = MediaQuery.of(context).size.width;
    final isOverflowing = screenWidth <
        1300; // Check if the screen width is less than the threshold

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search Service',
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
                  DataColumn(label: Text('First Hour Charge')),
                  DataColumn(label: Text('Later Hour Charge')),
                  DataColumn(label: Text('Description')),
                  DataColumn(label: Text('Created At')),
                  DataColumn(label: Text('Action')),
                ],
                rows: List.generate(
                  4,
                  (index) => DataRow(
                    cells: [
                      DataCell(
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundImage:
                                  AssetImage(AppPngPath.homeCleanOne),
                            ),
                            const SizedBox(width: 8),
                            Text(index % 2 == 0 ? 'Plumber' : 'Electrical'),
                          ],
                        ),
                      ),
                      DataCell(Text(index % 2 == 0 ? '299' : '377')),
                      DataCell(Text(index % 2 == 0 ? '199' : '277')),
                      const DataCell(Text('Good at Work')),
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
