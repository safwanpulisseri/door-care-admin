import 'package:door_care_admin/feature/services/view/page/service_page.dart';
import 'package:door_care_admin/feature/users/view/page/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/color/app_color.dart';
import '../../../../core/util/svg_asset.dart';
import '../../../dashboard/view/page/dashboard.dart';
import '../../../requests/view/page/request_page.dart';
import '../../../workers/view/page/worker_page.dart';

class HomeNavigation extends StatefulWidget {
  const HomeNavigation({super.key});

  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const DashboardPage(),
    const UserPage(),
    const ServicePage(),
    const WorkerPage(),
    const RequestPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      body: Row(
        children: <Widget>[
          Container(
            width: isMobile ? 60 : 260,
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
                    padding: const EdgeInsets.all(16),
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
                          title: isMobile ? null : const Text('Home'),
                          onTap: () => _onItemTapped(0),
                        ),
                        ListTile(
                          leading: SvgPicture.asset(AppSvgPath.drawerTwo),
                          title: isMobile ? null : const Text('Users'),
                          onTap: () => _onItemTapped(1),
                        ),
                        ListTile(
                          leading: SvgPicture.asset(AppSvgPath.drawerThree),
                          title: isMobile ? null : const Text('Services'),
                          onTap: () => _onItemTapped(2),
                        ),
                        ListTile(
                          leading: SvgPicture.asset(AppSvgPath.drawerFour),
                          title: isMobile ? null : const Text('Workers'),
                          onTap: () => _onItemTapped(3),
                        ),
                        ListTile(
                          leading: SvgPicture.asset(AppSvgPath.drawerFive),
                          title: isMobile ? null : const Text('Report'),
                          onTap: () => _onItemTapped(4),
                        ),
                        ListTile(
                          leading: SvgPicture.asset(AppSvgPath.drawerSix),
                          title: isMobile ? null : const Text('Requests'),
                          onTap: () => _onItemTapped(5),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                AppBar(
                  title: const Text(
                    "Hey Safwan - here's what’s happening with your store today",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
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
