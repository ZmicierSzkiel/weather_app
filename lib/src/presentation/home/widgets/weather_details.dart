import 'package:flutter/material.dart';
import 'package:weather_app/src/presentation/home/widgets/weather_details_item.dart';

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
          spacing: 70.0,
          runSpacing: 20.0,
          children: [
            WeatherDetailsItem(
              icon: const Icon(
                Icons.cloud_outlined,
              ),
              value: '${humidity.round()}%',
            ),
            WeatherDetailsItem(
              icon: const Icon(
                Icons.water_drop_outlined,
              ),
              value: '${precipitation.ceil()} mm',
            ),
            WeatherDetailsItem(
              icon: const Icon(Icons.thermostat_outlined),
              value: '$pressure hPa',
            ),
            WeatherDetailsItem(
              icon: const Icon(Icons.air_outlined),
              value: '$windSpeed km/h',
            ),
            WeatherDetailsItem(
              icon: const Icon(Icons.explore_outlined),
              value: windDirection,
            ),
          ],
        ),
      ],
    );
  }
}
