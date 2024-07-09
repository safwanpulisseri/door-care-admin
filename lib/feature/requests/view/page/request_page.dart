import 'package:flutter/material.dart';
import '../../../../core/theme/color/app_color.dart';
import '../../../../core/util/png_asset.dart';
import '../widget/dialog_info_widget.dart';

class RequestPage extends StatelessWidget {
  const RequestPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                                    backgroundColor: AppColor.toneEight),
                                onPressed: () {},
                                child: const Text("Accept")),
                            const SizedBox(
                              width: 5,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.toneSeven,
                                ),
                                onPressed: () {},
                                child: const Text("Decline")),
                          ],
                        ),
                      ),
                      DataCell(
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                contentPadding: EdgeInsets.zero,
                                content: Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          const Text(
                                            'Request Details',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                  AppPngPath.homeCleanOne),
                                              const SizedBox(
                                                width: 50,
                                              ),
                                              Image.asset(
                                                  AppPngPath.homeCleanTwo),
                                            ],
                                          ),
                                          const SizedBox(height: 20),
                                          const InfoRow(
                                              label: 'Name', value: 'Jhon Doe'),
                                          const InfoRow(
                                              label: 'Email',
                                              value: 'Jhondoe.Gmail.Com'),
                                          const InfoRow(
                                              label: 'Phone',
                                              value: '9987653456'),
                                          const InfoRow(
                                              label: 'Location',
                                              value: 'Kozhikode/Example'),
                                          const InfoRow(
                                              label: 'Category',
                                              value: 'Electrical Work'),
                                          const InfoRow(
                                              label: 'Experience', value: '7'),
                                          const SizedBox(height: 20),
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      right: 0.0,
                                      top: 0.0,
                                      child: IconButton(
                                        icon: const Icon(Icons.cancel),
                                        color: Colors.red,
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.visibility,
                            color: AppColor.toneSix,
                          ),
                        ),
                      ),
                    ],
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
