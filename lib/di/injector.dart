import 'package:flutter/cupertino.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:flutter_weather_bloc/api/current_location_api.dart';
import 'package:flutter_weather_bloc/api/weather_api_manager.dart';
import 'package:flutter_weather_bloc/di/builders.dart';
import 'package:flutter_weather_bloc/screens/get_location_screen/bloc/get_location_bloc.dart';
import 'package:flutter_weather_bloc/screens/get_location_screen/content/get_location_bloc_context.dart';
import 'package:flutter_weather_bloc/screens/get_location_screen/view/get_location_screen.dart';
import 'package:flutter_weather_bloc/utils/bloc_utils/bloc_provider.dart';

class Injection {
  static final Injector injector = Injector('injection');

  static Widget getCompositionRoot() {
    return injector.get<GetLocationScreenBuilder>()();
  }

  static void initialize() {
    _registerResouces();
    _registerBlocs();
    _registerScreenBuilders();
  }

  static void _registerBlocs() {
    injector.map<IGetLocationBloc>(
        (i) => GetLocationBloc(currentLocation: i.get<ICurrentLocationApi>()));
  }

  static void _registerResouces() {
    injector.map<ICurrentLocationApi>((i) => CurrentLocationApi(),
        isSingleton: true);
    injector.map<IWeatherApiManager>((i) => WeatherApiManager(),
        isSingleton: true);
  }

  static void _registerScreenBuilders() {
    injector.map<GetLocationScreenBuilder>((i) => () {
          return BlocProvider(
              child: GetLocationScreen(),
              bloc: i.get<IGetLocationBloc>(),
              blocContext: GetLocationBlocContext());
        });
  }
}
