import 'package:weather_app/src/domain/entity/weather_api_response.dart';
import 'package:weather_app/src/data/provider/weather_repository_provider.dart';
import 'package:weather_app/src/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRepositoryProvider _repositoryProvider;

  WeatherRepositoryImpl({
    required WeatherRepositoryProvider weatherRepositoryProvider,
  }) : _repositoryProvider = WeatherRepositoryProvider();

  @override
  Future<WeatherApiResponse> getWeatherData() async {
    return await _repositoryProvider.getWeatherDataFromApi();
  }
}
