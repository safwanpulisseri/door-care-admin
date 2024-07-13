import 'package:door_care_admin/core/theme/color/app_color.dart';
import 'package:door_care_admin/core/util/png_asset.dart';
import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get the screen width
    final screenWidth = MediaQuery.of(context).size.width;
    final isOverflowing = screenWidth <
        1050; // Check if the screen width is less than the threshold

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Users',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search User',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            // Wrap DataTable with Expanded to allow flexible height
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Profile')),
                  DataColumn(label: Text('Email')),
                  DataColumn(label: Text('Mobile')),
                  DataColumn(label: Text('Created At')),
                  DataColumn(label: Text('Action')),
                ],
                rows: List.generate(
                  5,
                  (index) => const DataRow(
                    cells: [
                      DataCell(
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
                      DataCell(Text('john.doe123@example.com')),
                      DataCell(Text('9876543210')),
                      DataCell(Text('24-05-2024')),
                      DataCell(
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
        ],
      ),
    );
  }
}
