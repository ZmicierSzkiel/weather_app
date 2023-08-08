import 'package:weather_app/src/domain/entity/city.dart';

class CityModel extends City {
  CityModel({
    required super.id,
    required super.name,
    required super.country,
  });

  factory CityModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return CityModel(
      id: json['id'],
      name: json['name'],
      country: json['country'],
    );
  }
}
