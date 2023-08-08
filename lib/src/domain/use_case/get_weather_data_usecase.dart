import 'package:weather_app/src/core/use_case.dart';
import 'package:weather_app/src/domain/entity/weather_api_response.dart';
import 'package:weather_app/src/domain/repository/weather_repository.dart';

class GetWeatherDataUseCase extends UseCase<WeatherApiResponse, NoParams> {
  final WeatherRepository repository;

  GetWeatherDataUseCase({
    required this.repository,
  });

  @override
  Future<WeatherApiResponse> execute(NoParams params) async {
    return await repository.getWeatherData();
  }
}
