// import 'package:flutter/material.dart';
// import '../../../../core/theme/color/app_color.dart';
// import '../../../../core/util/png_asset.dart';

// class VerifyPage extends StatelessWidget {
//   const VerifyPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text(
//             'Verify Page',
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 16),
//           TextField(
//             decoration: InputDecoration(
//               hintText: 'Search Newbees',
//               prefixIcon: const Icon(Icons.search),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//           ),
//           const SizedBox(height: 16),
//           Expanded(
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: DataTable(
//                 columns: const [
//                   DataColumn(label: Text('Profile')),
//                   DataColumn(label: Text('Email')),
//                   DataColumn(label: Text('Mobile')),
//                   // DataColumn(label: Text('Location')),
//                   DataColumn(label: Text('Service')),
//                   DataColumn(label: Text('Experience')),
//                   DataColumn(label: Text('Created At')),
//                   DataColumn(label: Text('View Details')),
//                 ],
//                 rows: List.generate(
//                   5,
//                   (index) => DataRow(
//                     cells: [
//                       const DataCell(
//                         Row(
//                           children: [
//                             CircleAvatar(
//                               backgroundImage:
//                                   AssetImage(AppPngPath.homeCleanOne),
//                             ),
//                             SizedBox(width: 8),
//                             Text('John Doe'),
//                           ],
//                         ),
//                       ),
//                       const DataCell(Text('john.doe123@example.com')),
//                       const DataCell(Text('9876543210')),
//                       //const DataCell(Text('Calicut')),
//                       DataCell(Text(index % 2 == 0 ? 'Plumber' : 'Electrical')),
//                       DataCell(Text(index % 2 == 0 ? '2' : '5')),
//                       const DataCell(Text('24-05-2024')),
//                       DataCell(
//                         Row(
//                           children: [
//                             ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                     backgroundColor: AppColor.toneEight),
//                                 onPressed: () {},
//                                 child: const Text("Accept")),
//                             const SizedBox(
//                               width: 5,
//                             ),
//                             ElevatedButton(
//                                 style: ElevatedButton.styleFrom(
//                                   backgroundColor: AppColor.toneSeven,
//                                 ),
//                                 onPressed: () {},
//                                 child: const Text("Decline")),
//                             const SizedBox(width: 8),
//                             IconButton(
//                                 onPressed: () {
//                                   showDialog(
//                                     context: context,
//                                     builder: (context) => AlertDialog(
//                                       //   backgroundColor: AppColor.background,
//                                       title: const Text(
//                                         'Request Details',
//                                         textAlign: TextAlign.center,
//                                       ),
//                                       content: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           Image.asset(AppPngPath.homeCleanOne),
//                                           const SizedBox(
//                                             width: 50,
//                                           ),
//                                           Image.asset(AppPngPath.homeCleanTwo),
//                                         ],
//                                       ),
//                                       actions: [
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: [
//                                             ElevatedButton(
//                                               style: ElevatedButton.styleFrom(
//                                                   backgroundColor:
//                                                       AppColor.toneEight),
//                                               onPressed: () {},
//                                               child: const Text("Accept"),
//                                             ),
//                                             const SizedBox(
//                                               width: 20,
//                                             ),
//                                             ElevatedButton(
//                                               style: ElevatedButton.styleFrom(
//                                                   backgroundColor:
//                                                       AppColor.toneSeven),
//                                               onPressed: () {},
//                                               child: const Text("Decline"),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   );
//                                 },
//                                 icon: const Icon(
//                                   Icons.visibility,
//                                   color: AppColor.toneSix,
//                                 ))
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
