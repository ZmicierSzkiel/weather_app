import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/core/app_locator.dart';
import 'package:weather_app/src/domain/use_case/get_weather_usecase.dart';
import 'package:weather_app/src/presentation/home/bloc/home_bloc.dart';
import 'package:weather_app/src/presentation/home/home_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        getWeatherUseCase: getIt<GetWeatherUseCase>(),
      )..add(
          const InitEvent(),
        ),
      child: const HomeScreen(),
    );
  }
}
