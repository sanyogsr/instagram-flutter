import 'package:flutter/material.dart';

class TextFieldInput extends StatelessWidget {
  TextEditingController textEditingController;
  final bool ispass;
  final TextInputType textInputType;
  final String hintText;
  TextFieldInput(
      {Key? key,
      required this.hintText,
      required this.textInputType,
      required this.ispass,
      required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final InputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextField(
      controller: textEditingController,
      obscureText: ispass,
      keyboardType: textInputType,
      decoration: InputDecoration(
          enabledBorder: InputBorder,
          focusedBorder: InputBorder,
          errorBorder: InputBorder,
          hintText: hintText,
          filled: true,
          contentPadding: const EdgeInsets.all(8)),
    );
  }
}
