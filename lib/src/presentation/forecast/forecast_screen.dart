import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/src/core/ui/app_circular_progress_indicator.dart';
import 'package:weather_app/src/core/ui/app_divider.dart';
import 'package:weather_app/src/core/ui/constants.dart';
import 'package:weather_app/src/core/ui/weather_appbar.dart';
import 'package:weather_app/src/presentation/forecast/bloc/forecast_bloc.dart';
import 'package:weather_app/src/presentation/forecast/widgets/forecast_screen_tile.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForecastBloc, ForecastState>(
      builder: (context, state) {
        if (state.status == ForecastStatus.loading) {
          return const Scaffold(
            body: Center(
              child: AppCircularProgressIndicator(),
            ),
          );
        }
        DateTime? previousDate;
        return Scaffold(
          appBar: WeatherAppBar(
            title: state.city.name,
          ),
          body: ListView.separated(
            separatorBuilder: (context, index) => const AppDivider(
              width: double.infinity,
            ),
            itemBuilder: (context, index) {
              final weatherData = state.weatherDataList[index];
              final currentDate = DateTime.parse(weatherData.dateTimeText);
              if (previousDate == null ||
                  previousDate?.day != currentDate.day) {
                previousDate = currentDate;
                return Column(
                  children: [
                    ListTile(
                      title: Text(
                        DateFormat('EEEE, MMMM d').format(currentDate),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Constants.primaryColor,
                        ),
                      ),
                    ),
                    ForecastScreenTile(
                      dateTimeText: weatherData.dateTimeText,
                      weatherDescription:
                          weatherData.currentWeatherDataWeather.description,
                      temperature: weatherData
                          .currentWeatherDataMain.temperature
                          .round()
                          .toString(),
                      icon: weatherData.currentWeatherDataWeather.icon,
                    ),
                  ],
                );
              } else {
                return ForecastScreenTile(
                  dateTimeText: weatherData.dateTimeText,
                  weatherDescription:
                      weatherData.currentWeatherDataWeather.description,
                  temperature: weatherData.currentWeatherDataMain.temperature
                      .round()
                      .toString(),
                  icon: weatherData.currentWeatherDataWeather.icon,
                );
              }
            },
            itemCount: state.weatherDataList.length,
          ),
        );
      },
    );
  }
}
