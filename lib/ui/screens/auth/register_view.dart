import 'package:bookia_store/const/app_colors.dart';
import 'package:bookia_store/const/arrwo_back_widget.dart';
import 'package:bookia_store/const/divider_widget.dart';
import 'package:bookia_store/cubit/user_cubit/cubit/user_cubit.dart';
import 'package:bookia_store/ui/screens/auth/widget/custom_Input_field.dart';
import 'package:bookia_store/ui/screens/home_screen.dart';
import 'package:bookia_store/ui/widgets/custom_button.dart';
import 'package:bookia_store/ui/widgets/custom_social_login.dart';
import 'package:bookia_store/ui/widgets/text_widget_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final TextEditingController userController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cPasswordController = TextEditingController();
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Form(
            key: globalKey,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: ArrwoBackWidget(
                    onPressed: () {},
                  ),
                ),
                TextWidgetApp(
                  title: "Hello! Register to get started",
                  color: AppColors.dark,
                ),
                const SizedBox(
                  height: 32,
                ),
                CustomInputField(
                  labelText: 'Username',
                  isDense: true,
                  controller: userController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                CustomInputField(
                  labelText: 'Email',
                  isDense: true,
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
                  isDense: true,
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
                CustomInputField(
                  labelText: 'Confirm Password',
                  isDense: true,
                  obscureText: true,
                  suffixIcon: true,
                  controller: cPasswordController,
                  validator: (value) {
                    if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                BlocConsumer<UserCubit, UserState>(
                  builder: (context, state) {
                    if (state is UserLogInLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    return state is UserLogInLoading
                        ? const Center(child: CircularProgressIndicator())
                        : SizedBox(
                            height: 56,
                            width: 331,
                            child: CustomButton(
                              title: "Register",
                              onTap: () {
                                if (globalKey.currentState!.validate()) {
                                  BlocProvider.of<UserCubit>(context).register(
                                      name: userController.text,
                                      email: emailController.text,
                                      password: passwordController.text,
                                      confirmationPassword:
                                          cPasswordController.text);
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
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    } else if (state is UserRegisterFailure) {
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
                const SizedBox(
                  height: 35,
                ),
                Row(
                  children: [
                    const DividerWidget(),
                    TextWidgetApp(title: "Or", color: AppColors.gray),
                    const DividerWidget(),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomSocialLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
