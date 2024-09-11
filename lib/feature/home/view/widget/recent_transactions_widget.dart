import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/color/app_color.dart';
import '../../../../core/util/png_asset.dart';
import '../../../report/bloc/bloc/fetch_all_completed_service_bloc.dart';

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchAllCompletedServiceBloc,
        FetchAllCompletedServiceState>(
      builder: (context, state) {
        if (state is FetchAllCompletedServiceLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FetchAllCompletedServiceSuccessState) {
          final transactions = state.fetchAllCompletedServiceModel;
          return Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: AppColor.background,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                width: 1,
                color: AppColor.toneThree.withOpacity(0.3),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColor.toneThree.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              children: [
                const Row(
                  children: [
                    Text(
                      'Recent Transactions',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // ElevatedButton.icon(
                    //   onPressed: () {},
                    //   icon: Icon(Icons.download),
                    //   label: Text('Export PDF'),
                    // ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      final transaction = transactions[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: transaction.serviceImg.isNotEmpty
                              ? NetworkImage(transaction.serviceImg)
                              : const AssetImage(AppPngPath.homeCleanTwo),
                        ),
                        title: Text(transaction.id),
                        subtitle: Text(
                            DateFormat('dd-MM-yyyy').format(transaction.date)),
                        trailing: Text(
                          '₹ ${transaction.price.toString()}',
                          style: TextStyle(
                            color: transaction.price < 0
                                ? Colors.red
                                : Colors.green,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else if (state is FetchAllCompletedServiceFailState) {
          return const Center(child: Text('Failed to fetch service details'));
        } else {
          return const Center(child: Text('No service details available'));
        }
      },
    );
  }
}

class Transaction {
  Transaction(this.description, this.date, this.amount);

  final String description;
  final String date;
  final double amount;
}
