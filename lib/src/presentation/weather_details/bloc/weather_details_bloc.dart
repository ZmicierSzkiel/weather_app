import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'weather_details_event.dart';
part 'weather_details_state.dart';

class WeatherDetailsBloc
    extends Bloc<WeatherDetailsEvent, WeatherDetailsState> {
  WeatherDetailsBloc() : super(const WeatherDetailsState()) {
    on<WeatherDetailsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
