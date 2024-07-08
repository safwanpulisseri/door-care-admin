import 'package:door_care_admin/core/theme/color/app_color.dart';
import 'package:door_care_admin/feature/home/view/widget/drawer_navigation_widget.dart';
import 'package:flutter/material.dart';
import '../widget/recent_transactions_widget.dart';
import '../widget/sales_report_widget.dart';
import '../widget/service_booking_widget.dart';
import '../widget/summary_cards_widget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          const DrawerWidget(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomScrollView(
                slivers: <Widget>[
                  const SliverAppBar(
                    title: Text(
                      "Hey Safwan - here's what’s happening with your store today",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    pinned: true,
                    backgroundColor: AppColor.background,
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        const SizedBox(height: 16),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  SalesReport(),
                                  SizedBox(height: 16),
                                  ServiceBookingsChart(),
                                  SizedBox(height: 16),
                                  RecentTransactions(),
                                ],
                              ),
                            ),
                            SizedBox(height: 16),
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  SizedBox(height: 16),
                                  SummaryCard('Total Customers', '33,493',
                                      '+36%', Colors.green),
                                  SizedBox(height: 16),
                                  SummaryCard('Total Workers', '1,382', '+36%',
                                      Colors.green),
                                  SizedBox(height: 16),
                                  SummaryCard('Total Orders', '84,382', '+36%',
                                      Colors.green),
                                  SizedBox(height: 16),
                                  SummaryCard('Total Services', '\$2,38,485',
                                      '+14%', Colors.red),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
