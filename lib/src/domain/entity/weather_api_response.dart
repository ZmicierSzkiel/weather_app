import 'package:weather_app/src/domain/entity/city.dart';
import 'package:weather_app/src/domain/entity/weather_data.dart';

class WeatherApiResponse {
  final List<WeatherData> weatherDataList;
  final City cityData;

  WeatherApiResponse({
    required this.weatherDataList,
    required this.cityData,
  });
}
