import 'package:door_care_admin/core/theme/color/app_color.dart';
import 'package:door_care_admin/core/util/svg_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    // Replace these with your actual pages
    Center(child: Text('Learn Content')),
    Center(child: Text('Practice Content')),
    Center(child: Text('Leaderboards Content')),
    Center(child: Text('Quests Content')),
    Center(child: Text('Shop Content')),
    Center(child: Text('Profile Content')),
    Center(child: Text('More Content')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: AppColor.toneThree.withOpacity(0.3),
                  width: 2,
                ),
              ),
            ),
            child: Drawer(
              backgroundColor: AppColor.background,
              child: Column(
                children: <Widget>[
                  Container(
                    color: AppColor.background,
                    padding: EdgeInsets.all(16),
                    child: SvgPicture.asset(
                      AppSvgPath.mainLogo,
                      height: 50,
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: <Widget>[
                        ListTile(
                          leading: SvgPicture.asset(AppSvgPath.drawerOne),
                          title: Text('Home'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: SvgPicture.asset(AppSvgPath.drawerTwo),
                          title: Text('Users'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: SvgPicture.asset(AppSvgPath.drawerThree),
                          title: Text('Services'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: SvgPicture.asset(AppSvgPath.drawerFour),
                          title: Text('Workers'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: SvgPicture.asset(AppSvgPath.drawerFive),
                          title: Text('Report'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: SvgPicture.asset(AppSvgPath.drawerSix),
                          title: Text('Requests'),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Hey Safwan - here's what’s happening with your store today",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 16),
                    _buildSalesReport(),
                    SizedBox(height: 16),
                    _buildRecentTransactions(),
                    SizedBox(height: 16),
                    _buildSummaryCards(),
                    Center(
                      child: Text('Notifications Content'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSalesReport() {
    // Placeholder for Sales Report
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Sales Report',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.download),
                label: Text('Export PDF'),
              ),
            ],
          ),
          SizedBox(height: 16),
          // Replace with your actual chart widget
          Container(
            height: 200,
            color: Colors.blue.shade50,
            child: Center(
              child: Text(
                'Chart Placeholder',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentTransactions() {
    // Placeholder for Recent Transactions
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Recent Transactions',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.check_circle, color: Colors.green),
                title: Text('Visa card **** 4831'),
                subtitle: Text('UPI payment'),
                trailing: Text('\$182.94'),
              ),
              ListTile(
                leading: Icon(Icons.check_circle, color: Colors.green),
                title: Text('Mastercard **** 6442'),
                subtitle: Text('Card payment'),
                trailing: Text('\$99.00'),
              ),
              ListTile(
                leading: Icon(Icons.hourglass_empty, color: Colors.orange),
                title: Text('Account **** 882'),
                subtitle: Text('Bank payment'),
                trailing: Text('\$249.94'),
              ),
              ListTile(
                leading: Icon(Icons.cancel, color: Colors.red),
                title: Text('**** 5666'),
                subtitle: Text('Wallet payment'),
                trailing: Text('\$199.24'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCards() {
    // Placeholder for Summary Cards
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildSummaryCard('Today\'s Sale', '\$12,426', '+36%', Colors.green),
        _buildSummaryCard('Monthly Sales', '\$2,38,485', '+14%', Colors.red),
        _buildSummaryCard('Total Sales', '\$2,38,485', '+14%', Colors.red),
        _buildSummaryCard('Total Customers', '33,493', '+36%', Colors.green),
        _buildSummaryCard('Total Workers', '1,382', '+36%', Colors.green),
        _buildSummaryCard('Total Orders', '84,382', '+36%', Colors.green),
      ],
    );
  }

  Widget _buildSummaryCard(
      String title, String amount, String change, Color changeColor) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              amount,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              change,
              style: TextStyle(
                fontSize: 16,
                color: changeColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
