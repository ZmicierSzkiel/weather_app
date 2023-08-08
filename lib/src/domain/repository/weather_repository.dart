import 'package:weather_app/src/domain/entity/weather_api_response.dart';

abstract class WeatherRepository {
  Future<WeatherApiResponse> getWeatherData();
}
