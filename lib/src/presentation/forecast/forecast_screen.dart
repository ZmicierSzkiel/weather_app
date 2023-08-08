import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/core/ui/app_circular_progress_indicator.dart';
import 'package:weather_app/src/core/ui/app_divider.dart';
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
              return ForecastScreenTile(
                dateTimeText: weatherData.dateTimeText,
                weatherDescription: weatherData.listWeather.description,
                temperature:
                    weatherData.listMain.temperature.round().toString(),
                icon: weatherData.listWeather.icon,
              );
            },
            itemCount: state.weatherDataList.length,
          ),
        );
      },
    );
  }
}
