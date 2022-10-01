import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final Icon icon;
  final bool? obscure;
  final TextEditingController textEditingController;
  const CustomInputField(
      {Key? key,
      required this.label,
      required this.icon,
      this.obscure,
      required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: obscure ?? false,
      decoration: InputDecoration(
        label: Text(label),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0XFF303f9f)),
          borderRadius: BorderRadius.circular(15.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0XFF303f9f)),
          borderRadius: BorderRadius.circular(15.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0XFF303f9f)),
          borderRadius: BorderRadius.circular(15.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.redAccent),
          borderRadius: BorderRadius.circular(15.0),
        ),
        filled: true,
        prefixIcon: icon,
        fillColor: Colors.white70,
      ),
    );
  }
}
