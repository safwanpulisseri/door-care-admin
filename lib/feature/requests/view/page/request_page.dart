import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/color/app_color.dart';
import '../../../../core/util/png_asset.dart';
import '../../bloc/fetch_requested_workers_bloc.dart';
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
            child: BlocBuilder<FetchRequestedWorkersBloc,
                FetchRequestedWorkersState>(
              builder: (context, state) {
                if (state is FetchRequestedWorkersLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColor.primary,
                    ),
                  );
                } else if (state is FetchRequestedWorkersSuccessState) {
                  return SingleChildScrollView(
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
                      rows: state.fetchWorkerModel.map((worker) {
                        return DataRow(
                          cells: [
                            DataCell(
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: AppColor.textfield,
                                    backgroundImage:
                                        worker.profileImage.isNotEmpty
                                            ? NetworkImage(worker.profileImage)
                                            : const AssetImage(
                                                AppPngPath.homeCleanTwo),
                                    // onBackgroundImageError:
                                    //     (exception, stackTrace) {
                                    //   // Optionally handle image loading errors here
                                    // },
                                  ),
                                  const SizedBox(width: 8),
                                  Text(worker.name),
                                ],
                              ),
                            ),
                            DataCell(Text(worker.email)),
                            DataCell(Row(
                              children: [
                                Text(worker.mobile),
                              ],
                            )),
                            DataCell(Text(worker.service)),
                            DataCell(Text(worker.experience.toString())),
                            DataCell(Text(DateFormat('dd-MM-yyyy').format(worker
                                .createdAt))), // Format DateTime to String
                            DataCell(
                              Row(
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColor.toneEight,
                                    ),
                                    onPressed: () {
                                      context
                                          .read<FetchRequestedWorkersBloc>()
                                          .add(AcceptRejectWorkerEvent(
                                              id: worker.id, status: 'accept'));
                                    },
                                    child: const Text('Accept'),
                                  ),
                                  const SizedBox(width: 8),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColor.toneSeven,
                                    ),
                                    onPressed: () {
                                      context
                                          .read<FetchRequestedWorkersBloc>()
                                          .add(AcceptRejectWorkerEvent(
                                              id: worker.id, status: 'reject'));
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
                                      builder: (context) => DialogInfoWidget(
                                        name: worker.name,
                                        email: worker.email,
                                        phone: worker.mobile,
                                        location: worker.district,
                                        category: worker.service,
                                        experience:
                                            worker.experience.toString(),
                                        imagePath1: worker.profileImage,
                                        imagePath2: worker.idCardImage,
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
                        );
                      }).toList(),
                    ),
                  );
                } else if (state is FetchRequestedWorkersFailState) {
                  return const Center(child: Text('Failed to fetch workers'));
                } else {
                  return const Center(child: Text('No workers available'));
                }
              },
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
