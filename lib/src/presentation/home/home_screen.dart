import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

import 'package:weather_app/src/core/ui/app_circular_progress_indicator.dart';
import 'package:weather_app/src/core/ui/app_divider.dart';
import 'package:weather_app/src/core/ui/app_text_button.dart';
import 'package:weather_app/src/core/ui/constants.dart';
import 'package:weather_app/src/core/ui/weather_appbar.dart';
import 'package:weather_app/src/core/urls.dart';
import 'package:weather_app/src/domain/entity/weather_data.dart';
import 'package:weather_app/src/presentation/forecast/forecast.dart';
import 'package:weather_app/src/presentation/home/bloc/home_bloc.dart';
import 'package:weather_app/src/presentation/home/widgets/weather_details.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.status == HomeStatus.loading) {
          return const Scaffold(
            appBar: WeatherAppBar(
              title: 'Today',
            ),
            body: Center(
              child: AppCircularProgressIndicator(),
            ),
          );
        } else if (state.status == HomeStatus.failure) {
          return Scaffold(
            appBar: const WeatherAppBar(
              title: 'Today',
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Text(
                    'Error: ${state.errorMessage}',
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
                AppTextButton(
                  onPressed: () => context.read<HomeBloc>().add(
                        const InitEvent(),
                      ),
                  buttonTitle: 'Retry',
                ),
              ],
            ),
          );
        } else if (state.weatherDataList.isNotEmpty) {
          final WeatherData currentWeatherData = state.weatherDataList.first;
          final String message =
              '''Weather in ${state.city.name}, ${state.city.country}'''
              ''' is ${currentWeatherData.currentWeatherDataMain.temperature.round()}°C'''
              ''' | ${currentWeatherData.currentWeatherDataWeather.main}''';
          return Scaffold(
            appBar: const WeatherAppBar(
              title: 'Today',
            ),
            body: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const Forecast(),
                      ),
                    ),
                    child: Column(
                      children: [
                        Image(
                          image: NetworkImage(
                            Urls.weatherIcon(
                              currentWeatherData.currentWeatherDataWeather.icon,
                            ),
                          ),
                        ),
                        Text(
                          '${state.city.name}, ${state.city.country}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          '${currentWeatherData.currentWeatherDataMain.temperature.round()}°C | ${currentWeatherData.currentWeatherDataWeather.main}',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Constants.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const AppDivider(
                    width: 200,
                  ),
                  WeatherDetails(
                    humidity:
                        currentWeatherData.currentWeatherDataMain.humidity,
                    precipitation: currentWeatherData
                            .currentWeatherDataRain?.precipitation ??
                        0.0,
                    pressure:
                        currentWeatherData.currentWeatherDataMain.pressure,
                    windSpeed: currentWeatherData.currentWeatherDataWind.speed,
                    windDirection: _calculateWindDirection(
                      currentWeatherData.currentWeatherDataWind.degrees,
                    ),
                  ),
                  const AppDivider(
                    width: 200,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppTextButton(
                        onPressed: () {
                          Share.share(message);
                        },
                        buttonTitle: 'Share',
                      ),
                      AppTextButton(
                        onPressed: () {
                          context.read<HomeBloc>().add(
                                const InitEvent(),
                              );
                        },
                        buttonTitle: 'Get current weather',
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  String _calculateWindDirection(double degrees) {
    if (degrees >= 337.5 || degrees < 22.5) {
      return 'N';
    } else if (degrees >= 22.5 && degrees < 67.5) {
      return 'NE';
    } else if (degrees >= 67.5 && degrees < 112.5) {
      return 'E';
    } else if (degrees >= 112.5 && degrees < 157.5) {
      return 'SE';
    } else if (degrees >= 157.5 && degrees < 202.5) {
      return 'S';
    } else if (degrees >= 202.5 && degrees < 247.5) {
      return 'SW';
    } else if (degrees >= 247.5 && degrees < 292.5) {
      return 'W';
    } else {
      return 'NW';
    }
  }
}
