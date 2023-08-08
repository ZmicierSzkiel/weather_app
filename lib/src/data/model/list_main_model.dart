import 'package:weather_app/src/domain/entity/list_main.dart';

class ListMainModel extends ListMain {
  ListMainModel({
    required super.temperature,
    required super.feelsLike,
    required super.pressure,
    required super.seaLevel,
    required super.groundLevel,
    required super.humidity,
  });

  factory ListMainModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return ListMainModel(
      temperature: json['temp'].toDouble(),
      feelsLike: json['feels_like'].toDouble(),
      pressure: json['pressure'],
      seaLevel: json['sea_level'],
      groundLevel: json['grnd_level'],
      humidity: json['humidity'].toDouble(),
    );
  }
}
