import 'package:bookia_store/const/app_colors.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  final String labelText;

  final bool suffixIcon;
  final TextInputType? keyboardType;
  final bool? isDense;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  const CustomInputField({
    super.key,
    required this.labelText,
    this.suffixIcon = false,
    this.isDense,
    this.obscureText = false,
    this.validator,
    this.controller,
    this.keyboardType,
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 16),
      width: size.width * 0.9,
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
      child: Column(
        children: [
          TextFormField(
            obscureText: (widget.obscureText && _obscureText),
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
              labelText: widget.labelText,
              border: getBorderStyle(),
              enabledBorder: getBorderStyle(),
              focusedBorder: getBorderStyle(),
              isDense: (widget.isDense != null) ? widget.isDense : false,
              suffixIcon: widget.suffixIcon
                  ? IconButton(
                      icon: Icon(
                        _obscureText
                            ? Icons.remove_red_eye
                            : Icons.visibility_off_outlined,
                        color: Colors.black54,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    )
                  : null,
              suffixIconConstraints: (widget.isDense != null)
                  ? const BoxConstraints(maxHeight: 33)
                  : null,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (textValue) {
              if (textValue == null || textValue.isEmpty) {
                return 'required!';
              }
              return null;
            },
            controller: widget.controller,
          ),
        ],
      ),
    );
  }

  OutlineInputBorder getBorderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: AppColors.gray,
      ),
    );
  }
}
