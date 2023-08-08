import 'package:weather_app/src/domain/entity/current_weather_data_rain.dart';

class CurrentWeatherDataRainModel extends CurrentWeatherDataRain {
  CurrentWeatherDataRainModel({
    required super.precipitation,
  });

  factory CurrentWeatherDataRainModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return CurrentWeatherDataRainModel(
      precipitation: json['3h']?.toDouble(),
    );
  }
}
