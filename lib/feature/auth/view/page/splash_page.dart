import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/theme/color/app_color.dart';
import '../../../../../core/util/svg_asset.dart';
import '../../bloc/bloc/auth_bloc.dart';
import 'sign_in_page.dart';
import '../../../navigation_menu/view/page/navigation_menu.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const NavigationMenu(),
            ),
            (route) => false,
          );
        }
        if (state is AuthFailState) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const SignInPage(),
            ),
            (route) => false,
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColor.primary,
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                const Spacer(flex: 4),
                SvgPicture.asset(AppSvgPath.splashLogo),
                const Spacer(flex: 1)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
