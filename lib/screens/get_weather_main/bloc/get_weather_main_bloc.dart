import 'package:flutter/cupertino.dart';
import 'package:flutter_weather_bloc/api/weather_api_manager.dart';
import 'package:flutter_weather_bloc/models/weather.dart';
import 'package:flutter_weather_bloc/utils/bloc_utils/base_bloc.dart';

enum GetWeatherMainBlocEvent { doSomething }

abstract class IGetWeatherMainBloc extends BlocBase<GetWeatherMainBlocEvent> {
  void showMeWeather();
}

class GetWeatherMainBloc extends IGetWeatherMainBloc {
  final IWeatherApiManager weatherApi;
  final Weather _weather;

  GetWeatherMainBloc({@required this.weatherApi, @required Weather weather})
      : _weather = weather;

  @override
  void showMeWeather() {
    print(_weather.temp);
  }
}
