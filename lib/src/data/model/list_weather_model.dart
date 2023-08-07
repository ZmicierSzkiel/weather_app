import 'package:weather_app/src/domain/entity/list_weather.dart';

class ListWeatherModel extends ListWeather {
  ListWeatherModel({
    required int id,
    required String main,
    required String description,
    required String icon,
  }) : super(id: id, main: main, description: description, icon: icon);

  factory ListWeatherModel.fromJson(List<dynamic> jsonList) {
    final List<ListWeatherModel> weatherList = jsonList.map((json) {
      return ListWeatherModel(
        id: json['id'],
        main: json['main'],
        description: json['description'],
        icon: json['icon'],
      );
    }).toList();
    return ListWeatherModel(
      id: weatherList.first.id,
      main: weatherList.first.main,
      description: weatherList.first.description,
      icon: weatherList.first.icon,
    );
  }
}
