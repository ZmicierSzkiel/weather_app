import 'package:flutter_dotenv/flutter_dotenv.dart';

class Urls {
  static String weatherIcon(String iconCode) =>
      'http://openweathermap.org/img/wn/$iconCode@2x.png';
  static String baseUrl = 'api.openweathermap.org';
  static String baseLatitude = '53.9006';
  static String baseLongitude = '27.5590';
  static Map<String, String> headers = {
    'Content-Type': 'x-www-form-urlencoded',
  };
  static String token = dotenv.env['API_TOKEN'] ?? '';
}
