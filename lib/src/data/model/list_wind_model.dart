import 'package:weather_app/src/domain/entity/list_wind.dart';

class ListWindModel extends ListWind {
  ListWindModel({
    required super.speed,
    required super.degrees,
    required super.gust,
  });

  factory ListWindModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return ListWindModel(
      speed: json['speed'].toDouble(),
      degrees: json['deg'].toDouble(),
      gust: json['gust'].toDouble(),
    );
  }
}
