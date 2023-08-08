import 'package:weather_app/src/domain/entity/current_weather_data_wind.dart';

class CurrentWeatherDataWindModel extends CurrentWeatherDataWind {
  CurrentWeatherDataWindModel({
    required super.speed,
    required super.degrees,
    required super.gust,
  });

  factory CurrentWeatherDataWindModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return CurrentWeatherDataWindModel(
      speed: json['speed'].toDouble(),
      degrees: json['deg'].toDouble(),
      gust: json['gust'].toDouble(),
    );
  }
}
