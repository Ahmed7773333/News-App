// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool isPassword;
  final IconData? preIcon;
  final IconData? suffIcon;
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hint,
      required this.isPassword,
      this.preIcon,
      this.suffIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodyMedium,
      controller: controller,
      obscureText: isPassword,
      validator: (value) {
        if (value?.trim().isEmpty ?? false) {
          return 'Field can\'t be empty';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontWeight: FontWeight.w100,
            ),
        prefixIcon: Icon(preIcon),
        suffixIcon: Icon(suffIcon),
        contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            width: 2,
            color: Theme.of(context).indicatorColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: const BorderSide(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  List<Object?> get props => [controller, hint, isPassword, preIcon, suffIcon];
}
