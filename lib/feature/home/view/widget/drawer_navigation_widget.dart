import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theme/color/app_color.dart';
import '../../../../core/util/svg_asset.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    title: const Text('Home'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: SvgPicture.asset(AppSvgPath.drawerTwo),
                    title: const Text('Users'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: SvgPicture.asset(AppSvgPath.drawerThree),
                    title: const Text('Services'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: SvgPicture.asset(AppSvgPath.drawerFour),
                    title: const Text('Workers'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: SvgPicture.asset(AppSvgPath.drawerFive),
                    title: const Text('Report'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: SvgPicture.asset(AppSvgPath.drawerSix),
                    title: const Text('Requests'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
