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
      speed: json['speed'],
      degrees: json['deg'],
      gust: json['gust'],
    );
  }
}
