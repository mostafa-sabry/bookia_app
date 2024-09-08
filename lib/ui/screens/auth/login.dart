import 'package:bookia_store/consts/app_colors.dart';
import 'package:bookia_store/consts/my_validators.dart';
import 'package:bookia_store/ui/screens/auth/register_screen.dart';
import 'package:bookia_store/ui/screens/home_screen.dart';
import 'package:bookia_store/ui/widgets/text_widget_app.dart';
import 'package:flutter/material.dart';

import '../../../consts/arrwo_back_widget.dart';
import '../../../consts/data_return.dart';
import '../../../consts/divider_widget.dart';
import '../../widgets/custom_elevated_button_widget.dart';
import '../../widgets/custom_social_login.dart';
import '../../widgets/custom_text_from_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final FocusNode emailFocusNode;
  late final FocusNode passwordFocusNode;
  final formKey = GlobalKey<FormState>();
  bool obscureText = true;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _loginFct() async {
    if (formKey.currentState?.validate() ?? false) {
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ArrwoBackWidget(
                  onPressed: () {},
                ),
                const TextWidgetApp(
                  title: 'Welcome back! Glad to see you, Again!',
                  fontSize: 30,
                  color: Colors.black,
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 32,
                ),
                CustomTextFormFieldWidget(
                  controller: emailController,
                  focusNode: emailFocusNode,
                  hintText: "Enter Your Email",
                  prefixIcon: Icons.email_outlined,
                  obscureText: false,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  validator: MyValidators.emailValidator,
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(passwordFocusNode);
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextFormFieldWidget(
                  controller: passwordController,
                  focusNode: passwordFocusNode,
                  hintText: "Enter Your Password",
                  prefixIcon: Icons.lock,
                  obscureText: obscureText,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  validator: MyValidators.passwordValidator,
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  ),
                  onFieldSubmitted: (value) {
                    _loginFct();
                  },
                ),
                DataReturn(
                  title: 'Forgot Password?',
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomElevatedButtonWidget(
                  title: 'Login',
                  color: AppColors.primary,
                  colorSubTitle: AppColors.border,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const HomeScreen();
                    }));
                  },
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    const DividerWidget(),
                    TextWidgetApp(
                      title: 'Or Login with',
                      color: AppColors.darkGray,
                      fontSize: 14,
                    ),
                    const DividerWidget(),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                const Row(
                  children: [
                    CustomSocialLogin(
                      image: 'assets/svgs/facebook_ic.svg',
                    ),
                    CustomSocialLogin(
                      image: 'assets/svgs/google_ic.svg',
                    ),
                    CustomSocialLogin(
                      image: 'assets/svgs/apple_ic.svg',
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidgetApp(
                      title: "Don’t have an account?",
                      color: AppColors.dark,
                      fontSize: 14,
                    ),
                    DataReturn(
                      title: 'Register Now',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const RegisterScreen();
                            },
                          ),
                        );
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
