import 'package:flutter/material.dart';
import '../../../../core/theme/color/app_color.dart';

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
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
              itemCount: getTransactions().length,
              itemBuilder: (context, index) {
                final transaction = getTransactions()[index];
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: AppColor.toneEight,
                  ),
                  title: Text(transaction.description),
                  subtitle: Text(transaction.date),
                  trailing: Text(
                    '\$${transaction.amount.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: transaction.amount < 0 ? Colors.red : Colors.green,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Transaction> getTransactions() {
    return [
      Transaction('Service Booking - Electrical', '2024-06-01', -150.0),
      Transaction('Service Booking - Plumbing', '2024-06-02', -200.0),
      Transaction('Service Booking - Home Cleaning', '2024-06-03', -100.0),
      Transaction('Service Booking - Carpentry', '2024-06-04', -120.0),
    ];
  }
}

class Transaction {
  Transaction(this.description, this.date, this.amount);

  final String description;
  final String date;
  final double amount;
}
