part of 'forecast_bloc.dart';

sealed class ForecastEvent extends Equatable {
  const ForecastEvent();

  @override
  List<Object> get props => [];
}

final class GetForecastDataEvent extends ForecastEvent {
  const GetForecastDataEvent();
}
