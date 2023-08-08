import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/src/core/urls.dart';

import 'package:weather_app/src/data/model/city_model.dart';
import 'package:weather_app/src/data/model/weather_data_model.dart';
import 'package:weather_app/src/domain/entity/city.dart';
import 'package:weather_app/src/domain/entity/weather_api_response.dart';
import 'package:weather_app/src/domain/entity/weather_data.dart';

class WeatherRepositoryProvider {
  final String token = dotenv.env['API_TOKEN'] ?? '';

  Future<WeatherApiResponse> getWeatherDataFromApi() async {
    try {
      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      final Map<String, String> headers = {
        'Content-Type': 'x-www-form-urlencoded',
      };
      final Uri uri = Uri.https(
        Urls.baseUrl,
        '/data/2.5/forecast',
        {
          'lat': position.latitude.toString(),
          'lon': position.longitude.toString(),
          'appid': token,
          'units': 'metric',
        },
      );
      final http.Response response = await http.get(
        uri,
        headers: headers,
      );
      if (response.statusCode == 200) {
        final List<dynamic> forecastData = jsonDecode(response.body)['list'];
        final City cityData = CityModel.fromJson(
          jsonDecode(response.body)['city'],
        );
        final List<WeatherData> weatherDataList = forecastData
            .map(
              (e) => WeatherDataModel.fromJson(e),
            )
            .toList();
        final WeatherApiResponse weatherApiResponse = WeatherApiResponse(
          weatherDataList: weatherDataList,
          cityData: cityData,
        );
        return weatherApiResponse;
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }
}
