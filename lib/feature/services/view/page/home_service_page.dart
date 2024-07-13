import 'package:doorcareadmin/feature/services/view/page/service_add_page.dart';
import 'package:doorcareadmin/feature/services/view/page/service_page.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/color/app_color.dart';

class HomeServicePage extends StatefulWidget {
  const HomeServicePage({super.key});

  @override
  State<HomeServicePage> createState() => _RequestHomePageState();
}

class _RequestHomePageState extends State<HomeServicePage> {
  int _selectedIndex = 0;
  bool _isAddServiceButtonPressed = false;
  final List<Widget> _pages = [
    const ServicePage(),
    const AddServicePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _isAddServiceButtonPressed = (index == 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: [
                AppBar(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (!_isAddServiceButtonPressed)
                        const Text(
                          'Manage Service',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      else
                        const Text(
                          'Add New Service',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      if (!_isAddServiceButtonPressed)
                        ElevatedButton(
                          onPressed: () {
                            _onItemTapped(1);
                          },
                          child: const Text("Add Service"),
                        )
                      else
                        ElevatedButton(
                          onPressed: () {
                            _onItemTapped(0);
                          },
                          child: const Text('Cancel'),
                        ),
                    ],
                  ),
                  backgroundColor: AppColor.background,
                ),
                Expanded(
                  child: IndexedStack(
                    index: _selectedIndex,
                    children: _pages,
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
