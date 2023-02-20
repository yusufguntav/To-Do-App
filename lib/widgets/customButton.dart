import 'package:flutter/material.dart';
import 'package:to_do_app/assets/constants.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.buttonOnpress,
    required this.buttonText,
  });
  Function() buttonOnpress;
  String buttonText;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: kMainColor,
      ),
      onPressed: buttonOnpress,
      child: Text(buttonText),
    );
  }
}
