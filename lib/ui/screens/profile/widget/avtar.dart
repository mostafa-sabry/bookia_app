import 'dart:io';

import 'package:bookia_store/cubit/user_cubit/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class HedersAvatar extends StatelessWidget {
  const HedersAvatar({
    super.key,
    required this.name,
    required this.email,
  });

  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Profile",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                ImagePicker().pickImage(source: ImageSource.gallery).then(
                    (value) =>
                        context.read<UserCubit>().uploadProfilePic(value!));
              },
              child: context.read<UserCubit>().profilePic == null
                  ? const CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          "https://wallpapers.com/images/high/anime-profile-picture-d60otwfhb125jmy2.webp"),
                    )
                  : CircleAvatar(
                      backgroundImage: FileImage(
                          File(context.read<UserCubit>().profilePic!.path)),
                    ),
            ),
            const SizedBox(width: 13),
            Column(
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
                Center(
                  child: Text(
                    email,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
