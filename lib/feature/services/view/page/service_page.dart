import 'package:doorcareadmin/core/theme/color/app_color.dart';
import 'package:doorcareadmin/core/util/png_asset.dart';
import 'package:doorcareadmin/feature/services/bloc/fetch_all_added_services/fetch_all_added_services_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

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
            child: BlocBuilder<FetchAllAddedServicesBloc,
                FetchAllAddedServicesState>(
              builder: (context, state) {
                if (state is FetchAllAddedServicesLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is FetchAllAddedServicesSuccessState) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('Profile')),
                          DataColumn(label: Text('First Hour Charge')),
                          DataColumn(label: Text('Later Hour Charge')),
                          DataColumn(label: Text('Description')),
                          DataColumn(label: Text('Created At')),
                          // DataColumn(label: Text('Action')),
                        ],
                        rows: state.fetchAllServiceModel.map((service) {
                          return DataRow(
                            cells: [
                              DataCell(
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage:
                                          service.serviceImg.isNotEmpty
                                              ? NetworkImage(service.serviceImg)
                                              : const AssetImage(
                                                  AppPngPath.homeCleanTwo),
                                      // onBackgroundImageError:
                                      //     (exception, stackTrace) {
                                      //   // Optionally handle image loading errors here
                                      // },
                                    ),
                                    const SizedBox(width: 8),
                                    Text(service.serviceName),
                                  ],
                                ),
                              ),
                              DataCell(
                                  Text(service.firstHourCharge.toString())),
                              DataCell(
                                  Text(service.laterHourCharge.toString())),
                              DataCell(Text(service.description)),
                              DataCell(Text(DateFormat('dd-MM-yyyy')
                                  .format(service.createdAt))),
                              // const DataCell(
                              //   Row(
                              //     children: [
                              //       Icon(Icons.block, color: AppColor.toneSeven),
                              //       SizedBox(width: 8),
                              //       Icon(Icons.edit, color: AppColor.toneEight),
                              //     ],
                              //   ),
                              // ),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  );
                } else if (state is FetchAllAddedServicesFailState) {
                  return const Center(child: Text('Failed to Added Service'));
                } else {
                  return const Center(child: Text('No Service available'));
                }
              },
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
