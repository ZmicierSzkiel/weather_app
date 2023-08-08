part of 'home_bloc.dart';

enum HomeStatus {
  loading,
  success,
  failure,
}

class HomeState extends Equatable {
  final HomeStatus status;
  final String errorMessage;
  final List<WeatherData> weatherDataList;
  final City city;

  const HomeState({
    required this.status,
    required this.errorMessage,
    required this.weatherDataList,
    required this.city,
  });

  HomeState copyWith({
    HomeStatus? status,
    String? errorMessage,
    List<WeatherData>? weatherDataList,
    City? city,
  }) {
    return HomeState(
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
