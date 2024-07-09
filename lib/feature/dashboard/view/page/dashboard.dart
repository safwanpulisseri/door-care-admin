import 'package:door_care_admin/core/theme/color/app_color.dart';
import 'package:flutter/material.dart';
import '../widget/recent_transactions_widget.dart';
import '../widget/sales_report_widget.dart';
import '../widget/service_booking_widget.dart';
import '../widget/summary_cards_widget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          // Wide screen layout
          return const SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 16),
                      SalesReport(),
                      SizedBox(height: 16),
                      ServiceBookingsChart(),
                      SizedBox(height: 16),
                      RecentTransactions(),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      SizedBox(height: 16),
                      SummaryCard('Total Customers', '33,493', '+36%',
                          AppColor.toneEight),
                      SizedBox(height: 16),
                      SummaryCard(
                          'Total Workers', '1,382', '+36%', AppColor.toneEight),
                      SizedBox(height: 16),
                      SummaryCard(
                          'Total Orders', '84,382', '+36%', AppColor.toneEight),
                      SizedBox(height: 16),
                      SummaryCard('Total Services', '\$2,38,485', '+14%',
                          AppColor.toneSeven),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          // Narrow screen layout (stacked)
          return const SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                SalesReport(),
                SizedBox(height: 16),
                ServiceBookingsChart(),
                SizedBox(height: 16),
                RecentTransactions(),
                SizedBox(height: 16),
                SummaryCard('Total Customers', '33,493', '+36%', Colors.green),
                SizedBox(height: 16),
                SummaryCard('Total Workers', '1,382', '+36%', Colors.green),
                SizedBox(height: 16),
                SummaryCard('Total Orders', '84,382', '+36%', Colors.green),
                SizedBox(height: 16),
                SummaryCard('Total Services', '\$2,38,485', '+14%', Colors.red),
              ],
            ),
          );
        }
      },
    );
  }
}
