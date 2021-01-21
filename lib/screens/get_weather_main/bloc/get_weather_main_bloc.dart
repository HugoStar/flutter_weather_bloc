import 'package:flutter/cupertino.dart';
import 'package:flutter_weather_bloc/api/weather_api_manager.dart';
import 'package:flutter_weather_bloc/utils/bloc_utils/base_bloc.dart';

enum GetWeatherMainBlocEvent { doSomething }

abstract class IGetWeatherMainBloc extends BlocBase<GetWeatherMainBlocEvent> {
  void showWeatherForPosition();
}

class GetWeatherMainBloc extends IGetWeatherMainBloc {
  final IWeatherApiManager weatherApi;

  GetWeatherMainBloc({@required this.weatherApi});

  @override
  void showWeatherForPosition() {
    print("take position");
  }
}
