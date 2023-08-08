import 'package:flutter/material.dart';
import 'package:weather_app/src/core/ui/constants.dart';

class AppTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonTitle;

  const AppTextButton({
    Key? key,
    required this.onPressed,
    required this.buttonTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        buttonTitle,
        style: const TextStyle(
          color: Constants.primaryColor,
          fontSize: 16,
        ),
      ),
    );
  }
}
