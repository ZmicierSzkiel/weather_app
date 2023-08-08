import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/core/app_locator.dart';
import 'package:weather_app/src/domain/use_case/get_weather_data_usecase.dart';
import 'package:weather_app/src/presentation/forecast/bloc/forecast_bloc.dart';
import 'package:weather_app/src/presentation/forecast/forecast_screen.dart';

class Forecast extends StatelessWidget {
  const Forecast({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForecastBloc(
        getWeatherDataUseCase: getIt<GetWeatherDataUseCase>(),
      )..add(
          const GetForecastDataEvent(),
        ),
      child: const ForecastScreen(),
    );
  }
}
