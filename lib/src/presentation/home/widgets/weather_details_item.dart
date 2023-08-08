import 'package:flutter/material.dart';

class WeatherDetailsItem extends StatelessWidget {
  final Icon icon;
  final String value;

  const WeatherDetailsItem({
    Key? key,
    required this.icon,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        icon,
        Text(value),
      ],
    );
  }
}
