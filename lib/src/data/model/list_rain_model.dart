import 'package:weather_app/src/domain/entity/list_rain.dart';

class ListRainModel extends ListRain {
  ListRainModel({
    required super.precipitation,
  });

  factory ListRainModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return ListRainModel(
      precipitation: json['3h']?.toDouble(),
    );
  }
}
