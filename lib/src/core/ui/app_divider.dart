import 'package:flutter/material.dart';
import 'package:weather_app/src/core/ui/constants.dart';

class AppDivider extends StatelessWidget {
  final double width;
  const AppDivider({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: const Divider(
        color: Constants.dividerColor,
        thickness: 1,
      ),
    );
  }
}
