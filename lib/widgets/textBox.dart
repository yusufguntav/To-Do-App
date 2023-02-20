import 'package:flutter/material.dart';
import 'package:to_do_app/assets/constants.dart';

class TextBox extends StatelessWidget {
  const TextBox({
    super.key,
    required this.textLabel,
    required this.textController,
  });
  final TextEditingController textController;
  final String textLabel;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      autofocus: true,
      decoration: InputDecoration(
        labelText: textLabel,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: kMainColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: kMainColor),
        ),
      ),
    );
  }
}
