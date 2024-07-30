import 'package:doorcareadmin/feature/auth/view/page/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'core/theme/app_theme.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        home: const SplashPage(),
      ),
    );
  }
}
