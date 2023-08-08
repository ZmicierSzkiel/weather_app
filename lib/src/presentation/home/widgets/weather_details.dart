import 'package:flutter/material.dart';

class WeatherDetails extends StatelessWidget {
  final double humidity;
  final double precipitation;
  final int pressure;
  final double windSpeed;
  final String windDirection;

  const WeatherDetails({
    Key? key,
    required this.humidity,
    required this.precipitation,
    required this.pressure,
    required this.windSpeed,
    required this.windDirection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 20.0,
          runSpacing: 10.0,
          children: [
            Text('Humidity: ${humidity.round()}%'),
            Text('Rain: ${precipitation.ceil()} mm'),
            Text('Pressure: $pressure hPa'),
            Text('Wind: $windSpeed km/h'),
            Text('Direction: $windDirection'),
          ],
        ),
      ],
    );
  }
}
