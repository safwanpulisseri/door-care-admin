import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/theme/color/app_color.dart';
import '../../../../core/util/png_asset.dart';
import '../widget/alert_dialog_widget.dart';

class RequestPage extends StatelessWidget {
  const RequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get the screen width
    final screenWidth = MediaQuery.of(context).size.width;
    final isOverflowing = screenWidth <
        1500; // Check if the screen width is less than the threshold

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'New Join Requests',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search Newbees',
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
                  DataColumn(label: Text('Mobile')),
                  DataColumn(label: Text('Service')),
                  DataColumn(label: Text('Experience')),
                  DataColumn(label: Text('Created At')),
                  DataColumn(label: Text('Action')),
                  DataColumn(label: Text('View Details')),
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
                      const DataCell(Text('9876543210')),
                      DataCell(Text(index % 2 == 0 ? 'Plumber' : 'Electrical')),
                      DataCell(Text(index % 2 == 0 ? '2' : '5')),
                      const DataCell(Text('24-05-2024')),
                      DataCell(
                        Row(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.toneEight,
                              ),
                              onPressed: () {
                                // Accept button logic
                              },
                              child: const Text('Accept'),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.toneSeven,
                              ),
                              onPressed: () {
                                // Decline button logic
                              },
                              child: const Text('Decline'),
                            ),
                          ],
                        ),
                      ),
                      DataCell(
                        Center(
                          child: IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => const DialogInfoWidget(
                                  name: 'John Doe',
                                  email: 'john.doe123@example.com',
                                  phone: '9876543210',
                                  location: 'Kozhikode/Example',
                                  category: 'Electrical Work',
                                  experience: '7',
                                  imagePath1: AppPngPath.homeCleanOne,
                                  imagePath2: AppPngPath.homeCleanTwo,
                                ),
                              );
                            },
                            icon: const FaIcon(
                              FontAwesomeIcons.eye,
                              color: AppColor.toneSix,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Displaying a hint to swipe for smaller screens or when there is overflow
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
