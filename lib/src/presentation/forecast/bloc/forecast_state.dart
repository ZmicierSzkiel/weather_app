part of 'forecast_bloc.dart';

enum ForecastStatus {
  loading,
  success,
  failure,
}

class ForecastState extends Equatable {
  final ForecastStatus status;
  final String errorMessage;
  final List<WeatherData> weatherDataList;
  final City city;

  const ForecastState({
    required this.status,
    required this.errorMessage,
    required this.weatherDataList,
    required this.city,
  });

  ForecastState copyWith({
    ForecastStatus? status,
    String? errorMessage,
    List<WeatherData>? weatherDataList,
    City? city,
  }) {
    return ForecastState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      weatherDataList: weatherDataList ?? this.weatherDataList,
      city: city ?? this.city,
    );
  }

  @override
  List<Object> get props => [
        status,
        errorMessage,
        weatherDataList,
        city,
      ];
}
