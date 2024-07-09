import 'package:door_care_admin/core/theme/color/app_color.dart';
import 'package:door_care_admin/core/util/svg_asset.dart';
import 'package:door_care_admin/feature/auth/view/widget/auth_button.dart';
import 'package:door_care_admin/feature/dashboard/view/page/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../util/auth_util.dart';
import '../widget/auth_text_form_field.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 400,
            padding: const EdgeInsets.all(32.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: const [
                BoxShadow(
                  color: AppColor.toneThree,
                  blurRadius: 50.0,
                  spreadRadius: 5.0,
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: SvgPicture.asset(
                      AppSvgPath.mainLogo,
                      height: 100,
                    ),
                  ),
                  Text(
                    'Sign in to your account',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        // fontWeight: FontWeight.bold,
                        // color: AppColor.secondary,
                        // fontSize: 35,
                        ),
                  ),
                  const SizedBox(height: 16),
                  AuthTextFormField(
                    controller: _emailController,
                    labelText: 'E-mail',
                    hintText: 'Enter your email',
                    validator: AuthUtil.validateEmail,
                    prefixIcon: AppSvgPath.mailLogo,
                  ),
                  AuthTextFormField(
                    controller: _passwordController,
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    obscureText: true,
                    validator: AuthUtil.validatePassword,
                    prefixIcon: AppSvgPath.passwordLogo,
                    showPasswordToggle: true,
                  ),
                  const SizedBox(height: 16),
                  AuthButton(
                      buttonText: "Login",
                      buttonCallback: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DashboardPage()));
                        }
                      },
                      textCallback: () {},
                      navigationTitle:
                          "By logging in, you accept our Platform Rules",
                      navigationSubtitle: ""),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
