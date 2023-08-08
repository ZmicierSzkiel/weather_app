import 'package:weather_app/src/domain/entity/current_weather_data_main.dart';

class CurrentWeatherDataMainModel extends CurrentWeatherDataMain {
  CurrentWeatherDataMainModel({
    required super.temperature,
    required super.feelsLike,
    required super.pressure,
    required super.seaLevel,
    required super.groundLevel,
    required super.humidity,
  });

  factory CurrentWeatherDataMainModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return CurrentWeatherDataMainModel(
      temperature: json['temp'].toDouble(),
      feelsLike: json['feels_like'].toDouble(),
      pressure: json['pressure'],
      seaLevel: json['sea_level'],
      groundLevel: json['grnd_level'],
      humidity: json['humidity'].toDouble(),
    );
  }
}
