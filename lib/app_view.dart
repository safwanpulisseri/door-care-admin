import 'package:door_care_admin/feature/auth/view/page/sign_up_page.dart';
import 'package:door_care_admin/feature/home/view/page/home.dart';
import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: DashboardPage(),
    );
  }
}
