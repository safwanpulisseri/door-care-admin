import 'package:doorcareadmin/feature/navigation_menu/view/page/home_navigation.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'core/theme/app_theme.dart';
import 'feature/auth/view/page/sign_up_page.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        home: const HomeNavigation(),
      ),
    );
  }
}
