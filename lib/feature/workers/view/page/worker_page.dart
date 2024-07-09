import 'package:door_care_admin/core/util/png_asset.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/color/app_color.dart';

class WorkerPage extends StatelessWidget {
  const WorkerPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                      DataCell(Text(index % 2 == 0 ? 'Plumber' : 'Electrical')),
                      DataCell(Text(index % 2 == 0 ? '2' : '5')),
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
          // const SizedBox(height: 16),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     IconButton(
          //       icon: const Icon(Icons.arrow_back),
          //       onPressed: () {},
          //     ),
          //     const SizedBox(width: 8),
          //     TextButton(
          //       onPressed: () {},
          //       style: TextButton.styleFrom(
          //         foregroundColor: Colors.white,
          //         backgroundColor: Colors.blue,
          //         shape: const CircleBorder(),
          //       ),
          //       child: const Text('1'),
          //     ),
          //     const SizedBox(width: 8),
          //     TextButton(
          //       onPressed: () {},
          //       style: TextButton.styleFrom(
          //         foregroundColor: Colors.blue,
          //         backgroundColor: Colors.white,
          //         shape: const CircleBorder(),
          //       ),
          //       child: const Text('2'),
          //     ),
          //     const SizedBox(width: 8),
          //     TextButton(
          //       onPressed: () {},
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
          //       onPressed: () {},
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
