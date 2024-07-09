import 'package:door_care_admin/feature/home_navigation_menu/view/page/home_navigation.dart';
import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const HomeNavigation(),
    );
  }
}
