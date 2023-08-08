import 'package:weather_app/src/domain/entity/current_weather_data_main.dart';
import 'package:weather_app/src/domain/entity/current_weather_data_rain.dart';
import 'package:weather_app/src/domain/entity/current_weather_data_weather.dart';
import 'package:weather_app/src/domain/entity/current_weather_data_wind.dart';

class WeatherData {
  final CurrentWeatherDataMain currentWeatherDataMain;
  final CurrentWeatherDataWeather currentWeatherDataWeather;
  final CurrentWeatherDataWind currentWeatherDataWind;
  final double probability;
  final CurrentWeatherDataRain? currentWeatherDataRain;
  final String dateTimeText;

  WeatherData({
    required this.currentWeatherDataMain,
    required this.currentWeatherDataWeather,
    required this.currentWeatherDataWind,
    required this.probability,
    required this.currentWeatherDataRain,
    required this.dateTimeText,
  });
}
