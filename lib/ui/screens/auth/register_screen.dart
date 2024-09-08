import 'package:bookia_store/consts/app_colors.dart';
import 'package:bookia_store/consts/my_validators.dart';
import 'package:bookia_store/ui/screens/auth/login.dart';
import 'package:bookia_store/ui/widgets/text_widget_app.dart';
import 'package:flutter/material.dart';

import '../../../consts/arrwo_back_widget.dart';
import '../../../consts/data_return.dart';
import '../../../consts/divider_widget.dart';
import '../../widgets/custom_elevated_button_widget.dart';
import '../../widgets/custom_social_login.dart';
import '../../widgets/custom_text_from_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController userNameController;
  late final TextEditingController confirmPasswordController;

  late final FocusNode emailFocusNode;
  late final FocusNode userNameFocusNode;
  late final FocusNode confirmPasswordFocusNode;
  late final FocusNode passwordFocusNode;
  final formKey = GlobalKey<FormState>();
  bool obscureText = true;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    userNameController = TextEditingController();
    emailFocusNode = FocusNode();
    passwordFocusNode = FocusNode();
    userNameFocusNode = FocusNode();
    confirmPasswordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    confirmPasswordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    userNameFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _registerFct() async {
    final isValid = formKey.currentState!.validate();
    FocusScope.of(context).unfocus();
    if (isValid) {}
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
                  title: 'Hello! Register to get started',
                  fontSize: 30,
                  color: Colors.black,
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 32,
                ),
                CustomTextFormFieldWidget(
                  controller: userNameController,
                  focusNode: userNameFocusNode,
                  hintText: "Username",
                  prefixIcon: Icons.supervised_user_circle_outlined,
                  obscureText: false,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    return MyValidators.displayNamevalidator(value);
                  },
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(userNameFocusNode);
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextFormFieldWidget(
                  controller: emailController,
                  focusNode: emailFocusNode,
                  hintText: "Enter Your Email",
                  prefixIcon: Icons.email_outlined,
                  obscureText: false,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    return MyValidators.emailValidator(value);
                  },
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(emailFocusNode);
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
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    return MyValidators.passwordValidator(value);
                  },
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
                    FocusScope.of(context).requestFocus(passwordFocusNode);
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomTextFormFieldWidget(
                  controller: confirmPasswordController,
                  focusNode: confirmPasswordFocusNode,
                  hintText: "Confirm Password",
                  prefixIcon: Icons.lock,
                  obscureText: obscureText,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    return MyValidators.passwordValidator(value);
                  },
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
                    FocusScope.of(context)
                        .requestFocus(confirmPasswordFocusNode);
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomElevatedButtonWidget(
                  title: 'Register',
                  color: AppColors.primary,
                  colorSubTitle: AppColors.border,
                  onPressed: () {
                    _registerFct();
                  },
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  children: [
                    const DividerWidget(),
                    TextWidgetApp(
                      title: 'Or register with',
                      color: AppColors.darkGray,
                      fontSize: 12,
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
                      title: "Already have an account?",
                      color: AppColors.dark,
                      fontSize: 14,
                    ),
                    DataReturn(
                      title: 'Login Now',
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginScreen();
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
