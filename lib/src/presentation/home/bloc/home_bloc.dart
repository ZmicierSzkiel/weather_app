import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/src/core/use_case.dart';
import 'package:weather_app/src/domain/entity/city.dart';
import 'package:weather_app/src/domain/entity/weather_api_response.dart';
import 'package:weather_app/src/domain/use_case/get_weather_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetWeatherUseCase _getWeatherUseCase;

  HomeBloc({
    required GetWeatherUseCase getWeatherUseCase,
  })  : _getWeatherUseCase = getWeatherUseCase,
        super(
          HomeState(
            status: HomeStatus.loading,
            errorMessage: '',
            weatherData: WeatherApiResponse(
              weatherDataList: [],
              cityData: City(
                id: 0,
                name: 'name',
                country: 'country',
              ),
            ),
          ),
        ) {
    on<InitEvent>(_onInitEvent);
  }

  Future<void> _onInitEvent(
    InitEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        status: HomeStatus.loading,
      ),
    );

    final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission;

    if (!serviceEnabled) {
      emit(
        state.copyWith(
          status: HomeStatus.failure,
          errorMessage:
              'Location services are disabled. Please enable the services',
        ),
      );
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        emit(
          state.copyWith(
            status: HomeStatus.failure,
            errorMessage: 'Location permissions are denied',
          ),
        );
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      emit(
        state.copyWith(
          status: HomeStatus.failure,
          errorMessage:
              'Location permissions are permanently denied, we cannot request permissions.',
        ),
      );
      return;
    }

    try {
      final WeatherApiResponse weatherData =
          await _getWeatherUseCase.execute(NoParams());
      emit(
        state.copyWith(
          status: HomeStatus.success,
          weatherData: weatherData,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: HomeStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
