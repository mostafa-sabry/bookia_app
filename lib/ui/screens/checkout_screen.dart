import 'package:bookia_store/const/app_colors.dart';
import 'package:bookia_store/cubit/order/cubit/order_cubit.dart';
import 'package:bookia_store/ui/screens/auth/widget/custom_Input_field.dart';
import 'package:bookia_store/ui/screens/order_complete.dart';
import 'package:bookia_store/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final TextEditingController fullNameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController notesController = TextEditingController();

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: globalKey,
                child: Column(
                  children: [
                    CustomInputField(
                      labelText: 'Full Name',
                      controller: fullNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your full name';
                        }
                        return null;
                      },
                    ),
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
                      labelText: 'Address',
                      controller: addressController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your address';
                        }
                        return null;
                      },
                    ),
                    CustomInputField(
                      labelText: 'Phone',
                      controller: phoneController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                          return 'Please enter a valid phone number (10 digits)';
                        }
                        return null;
                      },
                    ),
                    CustomInputField(
                      labelText: 'Notes',
                      controller: notesController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocConsumer<OrderCubit, OrderState>(
                      builder: (context, state) {
                        if (state is OrderLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return SizedBox(
                          height: 56,
                          width: double.infinity,
                          child: CustomButton(
                            title: "Checkout Order",
                            onTap: () {
                              if (globalKey.currentState!.validate()) {
                                BlocProvider.of<OrderCubit>(context).order(
                                  email: emailController.text,
                                  fullName: fullNameController.text,
                                  address: addressController.text,
                                  notes: notesController.text,
                                  phone: phoneController.text,
                                );
                              }
                            },
                            color: AppColors.background,
                            background: AppColors.primary,
                          ),
                        );
                      },
                      listener: (context, state) {
                        if (state is OrderAdded) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Success Order Added"),
                              backgroundColor: Colors.green,
                            ),
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const OrderComplete(),
                            ),
                          );
                        } else if (state is OrderError) {
                          // Show error message
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("No Order Add  Error"),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
