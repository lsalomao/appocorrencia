import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {this.hint,
      this.prefix,
      this.suffix,
      this.obscure = false,
      this.textInputType,
      this.onChanged});

  final String hint;
  final Widget prefix;
  final Widget suffix;
  final bool obscure;
  final TextInputType textInputType;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        // color: Colors.grey[200],
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          color: Colors.grey.shade500,
        ),
      ),
      padding: EdgeInsets.only(left: 16),
      child: TextField(
        obscureText: obscure,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          suffixIcon: suffix,
          prefixIcon: prefix,
        ),
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}
