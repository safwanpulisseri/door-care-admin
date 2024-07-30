import 'package:doorcareadmin/feature/auth/bloc/bloc/auth_bloc.dart';
import 'package:doorcareadmin/feature/auth/view/page/sign_in_page.dart';
import 'package:doorcareadmin/feature/requests/bloc/fetch_requested_workers_bloc.dart';
import 'package:doorcareadmin/feature/workers/bloc/fetch_all_workers_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toastification/toastification.dart';
import '../../../../core/theme/color/app_color.dart';
import '../../../../core/util/svg_asset.dart';
import '../../../../core/util/toastification_widget.dart';
import '../../../home/view/page/dashboard.dart';
import '../../../report/view/page/sales_report.dart';
import '../../../requests/view/page/request_page.dart';
import '../../../services/view/page/home_service_page.dart';
import '../../../users/bloc/bloc/fetch_user_bloc.dart';
import '../../../users/view/page/user_page.dart';
import '../../../workers/view/page/worker_page.dart';
import '../../bloc/bloc/navigation_bloc.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

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
                        _buildDrawerItem(
                            context, AppSvgPath.drawerOne, 'Home', 0, isMobile),
                        _buildDrawerItem(context, AppSvgPath.drawerTwo, 'Users',
                            1, isMobile),
                        _buildDrawerItem(context, AppSvgPath.drawerThree,
                            'Services', 2, isMobile),
                        _buildDrawerItem(context, AppSvgPath.drawerFour,
                            'Workers', 3, isMobile),
                        _buildDrawerItem(context, AppSvgPath.drawerFive,
                            'Report', 4, isMobile),
                        _buildDrawerItem(context, AppSvgPath.drawerSix,
                            'Requests', 5, isMobile),
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
                  actions: [
                    IconButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(SignOutEvent());
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInPage(),
                          ),
                          (route) => false,
                        );
                        ToastificationWidget.show(
                          context: context,
                          type: ToastificationType.success,
                          title: 'Success',
                          description: 'You have been signed out successfully.',
                        );
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.arrowRightFromBracket,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                ),
                Expanded(
                  child: BlocConsumer<NavigationBloc, NavigationState>(
                    listener: (context, state) {
                      if (state.selectedIndex == 1) {
                        context
                            .read<FetchUserBloc>()
                            .add(FetchUsersDetailsEvent());
                      } else if (state.selectedIndex == 3) {
                        context
                            .read<FetchAllWorkersBloc>()
                            .add(FetchAllWorkersDetilsEvent());
                      } else if (state.selectedIndex == 5) {
                        context
                            .read<FetchRequestedWorkersBloc>()
                            .add(FetchRequestedWorkersDetailsEvent());
                      }
                    },
                    builder: (context, state) {
                      return IndexedStack(
                        index: state.selectedIndex,
                        children: const [
                          DashboardPage(),
                          UserPage(),
                          HomeServicePage(),
                          WorkerPage(),
                          ReportPage(),
                          RequestPage(),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, String iconPath, String? label,
      int index, bool isMobile) {
    return ListTile(
      leading: SvgPicture.asset(iconPath),
      title: isMobile ? null : Text(label!),
      onTap: () {
        context.read<NavigationBloc>().add(NavigateTo(index));
      },
    );
  }
}
