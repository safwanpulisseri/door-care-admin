import 'package:doorcareadmin/core/theme/color/app_color.dart';
import 'package:doorcareadmin/core/util/png_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../auth/view/widget/loading_dialog.dart';
import '../../bloc/bloc/fetch_user_bloc.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isOverflowing = screenWidth < 1050;

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
            child: BlocBuilder<FetchUserBloc, FetchUserState>(
              builder: (context, state) {
                if (state is FetchLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is FetchSuccessState) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('Profile')),
                        DataColumn(label: Text('Email')),
                        DataColumn(label: Text('Mobile')),
                        DataColumn(label: Text('Action')),
                      ],
                      rows: state.fetchUserModel.map((user) {
                        return DataRow(
                          cells: [
                            DataCell(
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(user.profileImg),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(user.name),
                                ],
                              ),
                            ),
                            DataCell(Text(user.email)),
                            DataCell(Text(user.mobile)),
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
                        );
                      }).toList(),
                    ),
                  );
                } else if (state is FetchFailState) {
                  return const Center(child: Text('Failed to fetch users'));
                } else {
                  return const Center(child: Text('No users available'));
                }
              },
            ),
          ),
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
