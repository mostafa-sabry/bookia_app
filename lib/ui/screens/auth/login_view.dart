import 'package:bookia_store/const/app_colors.dart';
import 'package:bookia_store/const/arrwo_back_widget.dart';
import 'package:bookia_store/const/divider_widget.dart';
import 'package:bookia_store/cubit/user_cubit/cubit/user_cubit.dart';
import 'package:bookia_store/ui/screens/auth/widget/custom_Input_field.dart';
import 'package:bookia_store/ui/widgets/custom_button.dart';
import 'package:bookia_store/ui/widgets/custom_social_login.dart';
import 'package:bookia_store/ui/widgets/text_widget_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../nav_bar/bottom_nav_bar.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: ArrwoBackWidget(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextWidgetApp(
                        title: "Welcome back! Glad to see you, Again!",
                        color: AppColors.dark,
                        fontSize: 25,
                      ),
                      const SizedBox(height: 16),
                      CustomInputField(
                        labelText: 'Email',
                        controller: emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      CustomInputField(
                        labelText: 'Password',
                        obscureText: true,
                        suffixIcon: true,
                        controller: passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 13),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextWidgetApp(
                          title: "Forgot Password?",
                          color: AppColors.gray,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 30),

                      // BlocConsumer
                      BlocConsumer<UserCubit, UserState>(
                        builder: (context, state) {
                          if (state is UserLogInLoading) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          return SizedBox(
                            height: 56,
                            width: 331,
                            child: CustomButton(
                              title: "Login",
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  BlocProvider.of<UserCubit>(context).logIn(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                }
                              },
                              color: AppColors.background,
                              background: AppColors.primary,
                            ),
                          );
                        },
                        listener: (context, state) {
                          if (state is UserLogInSuccess) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Success"),
                                backgroundColor: Colors.green,
                              ),
                            );
                            // context.read<UserCubit>().getUserProfile();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const BottomNavBar(),
                              ),
                            );
                          } else if (state is UserLogInFailure) {
                            // Show error message
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(state.errorMessage),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                      ),

                      const SizedBox(height: 35),
                      Row(
                        children: [
                          const DividerWidget(),
                          TextWidgetApp(title: "Or", color: AppColors.gray),
                          const DividerWidget(),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const CustomSocialLogin(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
