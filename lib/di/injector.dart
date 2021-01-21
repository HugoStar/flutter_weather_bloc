import 'package:flutter/cupertino.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:flutter_weather_bloc/api/current_location_api.dart';
import 'package:flutter_weather_bloc/api/weather_api_manager.dart';
import 'package:flutter_weather_bloc/di/builders.dart';
import 'package:flutter_weather_bloc/screens/get_location_screen/bloc/get_location_bloc.dart';
import 'package:flutter_weather_bloc/screens/get_location_screen/content/get_location_bloc_context.dart';
import 'package:flutter_weather_bloc/screens/get_location_screen/view/get_location_screen.dart';
import 'package:flutter_weather_bloc/screens/get_weather_main/bloc/get_weather_main_bloc.dart';
import 'package:flutter_weather_bloc/screens/get_weather_main/context/get_weather_main_bloc_context.dart';
import 'package:flutter_weather_bloc/screens/get_weather_main/view/get_weather_main_screen.dart';
import 'package:flutter_weather_bloc/screens/tab_bar_screen/tab_container_screen.dart';
import 'package:flutter_weather_bloc/utils/bloc_utils/bloc_provider.dart';

class Injection {
  static final Injector injector = Injector('injection');

//Modules
  static Widget getCompositionRoot() {
    return injector.get<GetLocationScreenBuilder>()();
    // return injector.get<TabScreenBuilder>()();
  }

  static Widget getTabBarModule() {
    return injector.get<TabScreenBuilder>()();
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
    injector.map<IGetLocationBloc>(
        (i) => GetLocationBloc(currentLocation: i.get<ICurrentLocationApi>()));
    injector.mapWithParams<IGetWeatherMainBloc>((i, params) =>
        GetWeatherMainBloc(weatherApi: i.get<IWeatherApiManager>()));
  }

  static void _registerScreenBuilders() {
    injector.map<GetLocationScreenBuilder>((i) => () {
          return BlocProvider(
              child: GetLocationScreen(),
              bloc: i.get<IGetLocationBloc>(),
              blocContext: GetLocationBlocContext());
        });

    injector.map<GetWeatherMainScreenBuilder>((i) => () {
          return BlocProvider(
              child: GetWeatherMainScreen(),
              bloc: i.get<IGetWeatherMainBloc>(),
              blocContext: GetWeatherMainBlocContext());
        });

    injector.map<TabScreenBuilder>((i) => () {
          Widget firstTab = i.get<GetWeatherMainScreenBuilder>()();
          Widget secondTab = i.get<GetWeatherMainScreenBuilder>()();
          Widget thirdTab = i.get<GetWeatherMainScreenBuilder>()();

          return TabContainerScreen(
            content: TabContainerContent(
                firstTab: firstTab, secondTab: secondTab, thirdTab: thirdTab),
          );
        });
  }
}
