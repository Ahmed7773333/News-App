// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final VoidCallback onPreClicked;
  final VoidCallback func;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hint,
    required this.onPreClicked,
    required this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: const BorderSide(color: Colors.black)),
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: const BorderSide(color: Colors.black)),
        prefixIcon: InkWell(
            onTap: onPreClicked,
            child: const Icon(Icons.close, color: Colors.black)),
        suffixIcon: InkWell(
            onTap: () {}, child: const Icon(Icons.search, color: Colors.black)),
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.bodySmall,
      ),
      onSubmitted: (query) {
        func();
      },
    );
  }
}
