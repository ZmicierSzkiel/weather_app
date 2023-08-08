import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/src/core/use_case.dart';
import 'package:weather_app/src/domain/entity/city.dart';
import 'package:weather_app/src/domain/entity/weather_api_response.dart';
import 'package:weather_app/src/domain/entity/weather_data.dart';
import 'package:weather_app/src/domain/use_case/get_weather_data_usecase.dart';

part 'forecast_event.dart';
part 'forecast_state.dart';

class ForecastBloc extends Bloc<ForecastEvent, ForecastState> {
  final GetWeatherDataUseCase _getWeatherDataUseCase;

  ForecastBloc({required GetWeatherDataUseCase getWeatherDataUseCase})
      : _getWeatherDataUseCase = getWeatherDataUseCase,
        super(
          ForecastState(
            status: ForecastStatus.loading,
            errorMessage: '',
            weatherDataList: const [],
            city: City(
              id: 0,
              name: '',
              country: '',
            ),
          ),
        ) {
    on<GetForecastDataEvent>(_onGetForecastDataEvent);
  }

  Future<void> _onGetForecastDataEvent(
    GetForecastDataEvent event,
    Emitter<ForecastState> emit,
  ) async {
    try {
      final WeatherApiResponse weatherData =
          await _getWeatherDataUseCase.execute(NoParams());
      emit(
        state.copyWith(
          status: ForecastStatus.success,
          weatherDataList: weatherData.weatherDataList,
          city: weatherData.cityData,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ForecastStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
