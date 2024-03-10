import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:open_weather_cubit/constants/constants.dart';
import 'package:open_weather_cubit/cubits/weather/weather_cubit.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  late final StreamSubscription weatherSubscription;

  final WeatherCubit weatherCubit;

  ThemeCubit({
    required this.weatherCubit,
  }) : super(ThemeState.initial()) {
    weatherSubscription =
        weatherCubit.stream.listen((WeatherState weatherState) {
      debugPrint('weatherState: $weatherState');

      if (weatherState.weather.temp > kWarmOrNot) {
        emit(state.copyWith(
          appTheme: AppTheme.light,
        ));
      } else {
        emit(state.copyWith(
          appTheme: AppTheme.dark,
        ));
      }
    });
  }

  @override
  Future<void> close() {
    weatherSubscription.cancel();
    return super.close();
  }
}