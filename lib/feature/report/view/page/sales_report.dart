import 'package:doorcareadmin/core/theme/color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../core/util/png_asset.dart';
import '../../bloc/bloc/fetch_all_completed_service_bloc.dart';

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
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sales Report',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // ElevatedButton.icon(
              //   onPressed: () {
              //     // Handle date selection logic here
              //   },
              //   icon: const Icon(Icons.date_range),
              //   label: const Text('Select Date'),
              // ),
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
            child: BlocBuilder<FetchAllCompletedServiceBloc,
                FetchAllCompletedServiceState>(
              builder: (context, state) {
                if (state is FetchAllCompletedServiceLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is FetchAllCompletedServiceSuccessState) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: const [
                            DataColumn(label: Text('Service Details')),
                            DataColumn(label: Text('Booking Id')),
                            DataColumn(label: Text('User')),
                            DataColumn(label: Text('Worker')),
                            DataColumn(label: Text('Booked Date')),
                            DataColumn(label: Text('Payment')),
                            DataColumn(label: Text('Message')),
                            DataColumn(label: Text('Amount')),
                          ],
                          rows: state.fetchAllCompletedServiceModel
                              .map((services) {
                            return DataRow(
                              cells: [
                                DataCell(
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: services
                                                .serviceImg.isNotEmpty
                                            ? NetworkImage(services.serviceImg)
                                            : const AssetImage(
                                                AppPngPath.homeCleanTwo),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(services.serviceName),
                                    ],
                                  ),
                                ),
                                DataCell(Text(services.id)),
                                DataCell(Text(services.userName)),
                                DataCell(Text(services.workerName)),
                                DataCell(Text(DateFormat('dd-MM-yyyy')
                                    .format(services.date))),
                                DataCell(Text(services.payment.toString())),
                                DataCell(Text(services.description)),
                                DataCell(Text(services.price.toString())),
                              ],
                            );
                          }).toList(),
                        )),
                  );
                } else if (state is FetchAllCompletedServiceFailState) {
                  return const Center(
                      child: Text('Failed to fetch service details'));
                } else {
                  return const Center(
                      child: Text('No service details available'));
                }
              },
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
