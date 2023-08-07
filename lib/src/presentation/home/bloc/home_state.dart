part of 'home_bloc.dart';

enum HomeStatus {
  loading,
  success,
  failure,
}

class HomeState extends Equatable {
  final HomeStatus status;
  final String errorMessage;
  final WeatherApiResponse weatherData;

  const HomeState({
    required this.status,
    required this.errorMessage,
    required this.weatherData,
  });

  HomeState copyWith({
    HomeStatus? status,
    String? errorMessage,
    WeatherApiResponse? weatherData,
  }) {
    return HomeState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      weatherData: weatherData ?? this.weatherData,
    );
  }

  @override
  List<Object> get props => [
        status,
        errorMessage,
        weatherData,
      ];
}
