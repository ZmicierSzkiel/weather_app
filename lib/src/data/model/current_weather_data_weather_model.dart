import 'package:weather_app/src/domain/entity/current_weather_data_weather.dart';

class CurrentWeatherDataWeatherModel extends CurrentWeatherDataWeather {
  CurrentWeatherDataWeatherModel({
    required int id,
    required String main,
    required String description,
    required String icon,
  }) : super(id: id, main: main, description: description, icon: icon);

  factory CurrentWeatherDataWeatherModel.fromJson(List<dynamic> jsonList) {
    final List<CurrentWeatherDataWeatherModel> weatherList =
        jsonList.map((json) {
      return CurrentWeatherDataWeatherModel(
        id: json['id'],
        main: json['main'],
        description: json['description'],
        icon: json['icon'],
      );
    }).toList();
    return CurrentWeatherDataWeatherModel(
      id: weatherList.first.id,
      main: weatherList.first.main,
      description: weatherList.first.description,
      icon: weatherList.first.icon,
    );
  }
}
