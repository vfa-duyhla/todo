import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final String? emptyText;
  final bool isPassword;
  final Icon? icon;
  final TextEditingController controller;
  const AppTextField(
      {Key? key,
      required this.label,
      this.isPassword = false,
      this.icon,
      required this.controller,
      this.emptyText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      validator: (value) => value!.isEmpty ? emptyText : null,
      decoration: InputDecoration(
        prefixIcon: icon,
        hintText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
