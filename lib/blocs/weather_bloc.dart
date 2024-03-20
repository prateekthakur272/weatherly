import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

sealed class WeatherState extends Equatable {
  const WeatherState();
  @override
  List<Object?> get props => [];
}

class WeatherStateInitial extends WeatherState {}

class WeatherStateLoading extends WeatherState {}

class WeatherStateFailed extends WeatherState {
  final String message;
  const WeatherStateFailed(this.message);
  @override
  List<Object?> get props => [message];
}

class WeatherStateSuccess extends WeatherState {
  final Weather weather;
  const WeatherStateSuccess(this.weather);

  @override
  List<Object?> get props => [weather];
}

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();
  @override
  List<Object?> get props => [];
}

class GetWeather extends WeatherEvent {
  final Position position;
  const GetWeather(this.position);
  @override
  List<Object?> get props => [position];
}

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherStateInitial()) {
    on<GetWeather>((event, emit) async {
      emit(WeatherStateLoading());
      try {
        WeatherFactory weatherFactory =
            WeatherFactory('_apiKey', language: Language.ENGLISH);
        final Weather weather = await weatherFactory.currentWeatherByLocation(
            event.position.latitude, event.position.longitude);
        emit(WeatherStateSuccess(weather));
      } catch (e){
        emit (WeatherStateFailed(e.toString()));
      }
    });
  }
}
