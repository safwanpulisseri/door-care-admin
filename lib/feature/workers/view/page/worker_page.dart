import 'package:doorcareadmin/core/util/png_asset.dart';
import 'package:doorcareadmin/feature/workers/bloc/fetch_all_workers_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
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
            child: BlocBuilder<FetchAllWorkersBloc, FetchAllWorkersState>(
              builder: (context, state) {
                if (state is FetchAllWorkersLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColor.primary,
                    ),
                  );
                } else if (state is FetchAllWorkersSuccessState) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
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
                          DataColumn(label: Text('Status')),
                          //   DataColumn(label: Text('Action')),
                        ],
                        rows: state.fetchAllWorkersModel.map((worker) {
                          return DataRow(
                            cells: [
                              DataCell(
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          AppColor.toneThree.withOpacity(0.3),
                                      backgroundImage:
                                          worker.profileImage.isNotEmpty
                                              ? NetworkImage(
                                                  worker.profileImage,
                                                )
                                              : const AssetImage(
                                                  AppPngPath.personImage,
                                                ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(worker.name),
                                  ],
                                ),
                              ),
                              DataCell(Text(worker.email)),
                              DataCell(Text(worker.district)),
                              DataCell(Text(worker.service)),
                              DataCell(Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(worker.experience.toString()),
                                ],
                              )),
                              DataCell(Text(DateFormat('dd-MM-yyyy').format(
                                  worker
                                      .createdAt))), // Format DateTime to String
                              DataCell(
                                Text(
                                  worker.status == 'accept'
                                      ? 'Accepted'
                                      : 'Declined',
                                  style: TextStyle(
                                    color: worker.status == 'accept'
                                        ? AppColor.toneEight
                                        : AppColor.toneSeven,
                                  ),
                                ),
                              ),
                              // DataCell(
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
                } else if (state
                    is FetchRequestedWorkersNoAcceptedOrRejectedWorkersState) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.ban,
                          color: AppColor.toneThree,
                          size: 40,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text('No accepted/rejected workers available'),
                      ],
                    ),
                  );
                } else if (state is FetchAllWorkersFailState) {
                  return const Center(
                    child: Text(
                        'Failed to fetch details of accepted/rejected workers'),
                  );
                } else {
                  return const Center(
                    child: Text('No workers available '),
                  );
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
