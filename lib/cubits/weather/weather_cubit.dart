import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weatherapp/cubits/weather/weather_event.dart';

import '../../models/custom_error.dart';
import '../../models/weather.dart';
import '../../repositories/weather_repository.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent,WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc({required this.weatherRepository})
      : super(WeatherState.initial());

  Future<void> fetchWeather(String city) async {
    emit(state.copyWith(status: WeatherStatus.loading));

    try {
      final Weather weather = await weatherRepository.fetchWeather(city);

      emit(state.copyWith(
        status: WeatherStatus.loaded,
        weather: weather,
      ));
      print('state: $state');
    } on CustomError catch (e) {
      emit(state.copyWith(
        status: WeatherStatus.error,
        error: e,
      ));
      print('state: $state');
    }
  }
}
