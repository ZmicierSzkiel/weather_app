import 'package:weather_app/src/core/app_locator.dart';
import 'package:weather_app/src/data/provider/weather_repository_provider.dart';
import 'package:weather_app/src/data/repository/weather_repository_impl.dart';
import 'package:weather_app/src/domain/repository/weather_repository.dart';
import 'package:weather_app/src/domain/use_case/get_weather_usecase.dart';

Future<void> setupLocator() async {
  getIt.registerSingleton<WeatherRepositoryProvider>(
    WeatherRepositoryProvider(),
  );

  getIt.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(
      weatherRepositoryProvider: getIt.get<WeatherRepositoryProvider>(),
    ),
  );

  getIt.registerLazySingleton<GetWeatherUseCase>(
    () => GetWeatherUseCase(
      repository: getIt.get<WeatherRepository>(),
    ),
  );
}
