import 'package:flutter/material.dart';
import 'package:weather_app/src/core/ui/constants.dart';

class AppCircularProgressIndicator extends StatelessWidget {
  const AppCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: Constants.primaryColor,
      strokeAlign: 6.0,
    );
  }
}
