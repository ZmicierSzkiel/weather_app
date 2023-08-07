import 'package:weather_app/src/data/model/list_main_model.dart';
import 'package:weather_app/src/data/model/list_weather_model.dart';
import 'package:weather_app/src/data/model/list_wind_model.dart';
import 'package:weather_app/src/domain/entity/weather_data.dart';

class WeatherDataModel extends WeatherData {
  WeatherDataModel({
    required super.dateTime,
    required super.listMain,
    required super.listWeather,
    required super.listWind,
    required super.probability,
  });

  factory WeatherDataModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return WeatherDataModel(
      dateTime: json['dt'],
      listMain: ListMainModel.fromJson(json['main']),
      listWeather: ListWeatherModel.fromJson(json['weather']),
      listWind: ListWindModel.fromJson(json['wind']),
      probability: json['pop'].toDouble(),
    );
  }
}
