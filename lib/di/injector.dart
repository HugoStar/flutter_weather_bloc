import 'package:flutter/cupertino.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:flutter_weather_bloc/api/current_location_api.dart';
import 'package:flutter_weather_bloc/api/weather_api_manager.dart';
import 'package:flutter_weather_bloc/di/builders.dart';
import 'package:flutter_weather_bloc/models/weather.dart';
import 'package:flutter_weather_bloc/screens/get_location_screen/bloc/get_location_bloc.dart';
import 'package:flutter_weather_bloc/screens/get_location_screen/content/get_location_bloc_context.dart';
import 'package:flutter_weather_bloc/screens/get_location_screen/view/get_location_screen.dart';
import 'package:flutter_weather_bloc/screens/get_weather_main/bloc/get_weather_main_bloc.dart';
import 'package:flutter_weather_bloc/screens/get_weather_main/context/get_weather_main_bloc_context.dart';
import 'package:flutter_weather_bloc/screens/get_weather_main/view/get_weather_main_screen.dart';
import 'package:flutter_weather_bloc/screens/main_screen/bloc/main_bloc.dart';
import 'package:flutter_weather_bloc/screens/main_screen/context/main_bloc_context.dart';
import 'package:flutter_weather_bloc/screens/main_screen/view/main_screen.dart';
import 'package:flutter_weather_bloc/screens/tab_bar_screen/tab_container_screen.dart';
import 'package:flutter_weather_bloc/utils/bloc_utils/bloc_provider.dart';

class Injection {
  static final Injector injector = Injector('injection');

//Modules
  static Widget getCompositionRoot() {
    return injector.get<MainScreenBuilder>()();
  }

  static Widget getTabBarModule() {
    return injector.get<TabScreenBuilder>()();
  }

  static Widget getWeatherModule(Weather weather) {
    return injector.get<GetWeatherMainScreenBuilder>()(weather);
  }

  static void initialize() {
    _registerResouces();
    _registerBlocs();
    _registerScreenBuilders();
  }

  static void _registerResouces() {
    injector.map<ICurrentLocationApi>((i) => CurrentLocationApi(),
        isSingleton: true);
    injector.map<IWeatherApiManager>((i) => WeatherApiManager(),
        isSingleton: true);
  }

  static void _registerBlocs() {
    injector.map<IMainBloc>((i) => MainBloc());
    injector.map<IGetLocationBloc>((i) => GetLocationBloc(
        currentLocation: i.get<ICurrentLocationApi>(),
        weatherManager: i.get<IWeatherApiManager>()));
    injector.mapWithParams<IGetWeatherMainBloc>((i, params) {
      final Weather weather = params['weather'];
      assert(weather != null, "Обязателен параметр person!");
      return GetWeatherMainBloc(
          weatherApi: i.get<IWeatherApiManager>(), weather: weather);
    });
  }

  static void _registerScreenBuilders() {
    injector.map<MainScreenBuilder>((i) => () {
          return BlocProvider(
              child: MainScreen(),
              bloc: i.get<IMainBloc>(),
              blocContext: MainBlocContext());
        });

    injector.map<GetLocationScreenBuilder>((i) => () {
          return BlocProvider(
              child: GetLocationScreen(),
              bloc: i.get<IGetLocationBloc>(),
              blocContext: GetLocationBlocContext());
        });

    injector.map<GetWeatherMainScreenBuilder>((i) => (Weather weather) {
          return BlocProvider(
              child: GetWeatherMainScreen(),
              bloc: i.get<IGetWeatherMainBloc>(
                  additionalParameters: {'weather': weather}),
              blocContext: GetWeatherMainBlocContext());
        });

    injector.map<TabScreenBuilder>((i) => () {
          Widget firstTab = i.get<GetLocationScreenBuilder>()();
          Widget secondTab = i.get<GetLocationScreenBuilder>()();

          return TabContainerScreen(
            content:
                TabContainerContent(firstTab: firstTab, secondTab: secondTab),
          );
        });
  }
}
