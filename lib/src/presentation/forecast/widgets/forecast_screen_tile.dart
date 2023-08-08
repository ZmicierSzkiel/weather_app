import 'package:flutter/material.dart';

import 'package:weather_app/src/core/ui/constants.dart';
import 'package:weather_app/src/core/urls.dart';

class ForecastScreenTile extends StatelessWidget {
  final String dateTimeText;
  final String weatherDescription;
  final String temperature;
  final String icon;

  const ForecastScreenTile({
    Key? key,
    required this.dateTimeText,
    required this.weatherDescription,
    required this.temperature,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image(
        image: NetworkImage(
          Urls.weatherIcon(icon),
        ),
      ),
      title: Text(
        dateTimeText.substring(11, 16),
      ),
      subtitle: Text(
        weatherDescription.capitalize(),
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      trailing: Text(
        '$temperature°',
        style: const TextStyle(
          fontSize: 32,
          color: Constants.primaryColor,
        ),
      ),
    );
  }
}
