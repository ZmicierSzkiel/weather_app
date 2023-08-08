import 'package:weather_app/src/data/model/current_weather_data_main_model.dart';
import 'package:weather_app/src/data/model/current_weather_data_rain_model.dart';
import 'package:weather_app/src/data/model/current_weather_data_weather_model.dart';
import 'package:weather_app/src/data/model/current_weather_data_wind_model.dart';
import 'package:weather_app/src/domain/entity/weather_data.dart';

class WeatherDataModel extends WeatherData {
  WeatherDataModel({
    required super.currentWeatherDataMain,
    required super.currentWeatherDataWeather,
    required super.currentWeatherDataWind,
    required super.probability,
    super.currentWeatherDataRain,
    required super.dateTimeText,
  });

  factory WeatherDataModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return WeatherDataModel(
      currentWeatherDataMain:
          CurrentWeatherDataMainModel.fromJson(json['main']),
      currentWeatherDataWeather:
          CurrentWeatherDataWeatherModel.fromJson(json['weather']),
      currentWeatherDataWind:
          CurrentWeatherDataWindModel.fromJson(json['wind']),
      probability: json['pop'].toDouble(),
      currentWeatherDataRain: json['rain'] != null
          ? CurrentWeatherDataRainModel.fromJson(json['rain'])
          : null,
      dateTimeText: json['dt_txt'],
    );
  }
}
