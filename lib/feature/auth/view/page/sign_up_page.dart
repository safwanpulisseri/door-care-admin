import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toastification/toastification.dart';
import '../../../../core/theme/color/app_color.dart';
import '../../../../core/util/svg_asset.dart';
import '../../../navigation_menu/view/page/home_navigation.dart';
import '../../bloc/bloc/auth_bloc.dart';
import '../util/auth_util.dart';
import '../widget/auth_button.dart';
import '../widget/auth_text_form_field.dart';
import '../../../../core/util/toastification_widget.dart';
import '../widget/loading_dialog.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadingState) {
          LoadingDialog.show(context);
        } else if (state is AuthSuccessState) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const HomeNavigation()),
            (route) => false,
          );
          ToastificationWidget.show(
            context: context,
            type: ToastificationType.success,
            title: 'Success',
            description: 'Successfully signed in!',
            // backgroundColor: AppColor.toneEight,
            // textColor: AppColor.background,
          );
        } else if (state is AuthFailState) {
          Navigator.pop(context);
          ToastificationWidget.show(
            context: context,
            type: ToastificationType.error,
            title: 'Error',
            description: 'Failed to sign in. Please try again.',
            // backgroundColor: AppColor.toneSeven,
            // textColor: AppColor.background,
          );
        }
      },
      child: Scaffold(
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
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
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
                        FocusManager.instance.primaryFocus?.unfocus();
                        context.read<AuthBloc>().add(
                              EmailSignInAuthEvent(
                                email: _emailController.text,
                                password: _passwordController.text,
                              ),
                            );
                      },
                      textCallback: () {},
                      navigationTitle:
                          "By logging in, you accept our Platform Rules",
                      navigationSubtitle: "",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
