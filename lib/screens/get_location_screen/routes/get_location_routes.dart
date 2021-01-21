import 'package:flutter/cupertino.dart';
import 'package:flutter_weather_bloc/di/injector.dart';
import 'package:flutter_weather_bloc/models/weather.dart';
import 'package:flutter_weather_bloc/utils/route_utils/slide_right_route.dart';

class GetLocationRoutes {
  static void showWeatherModule(BuildContext context, Weather weather) {
    Navigator.push(
        context, SlideRightRoute(page: Injection.getWeatherModule(weather)));
  }
}
