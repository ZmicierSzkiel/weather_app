import 'package:weather_app/src/domain/entity/list_main.dart';
import 'package:weather_app/src/domain/entity/list_weather.dart';
import 'package:weather_app/src/domain/entity/list_wind.dart';

class WeatherData {
  final int dateTime;
  final ListMain listMain;
  final ListWeather listWeather;
  final ListWind listWind;
  final double probability;

  WeatherData({
    required this.dateTime,
    required this.listMain,
    required this.listWeather,
    required this.listWind,
    required this.probability,
  });
}