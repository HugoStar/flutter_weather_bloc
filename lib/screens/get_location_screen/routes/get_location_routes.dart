import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_bloc/di/injector.dart';
import 'package:flutter_weather_bloc/models/weather.dart';

class GetLocationRoutes {
  static void showWeatherModule(BuildContext context, Weather weather) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) =>
                Injection.getWeatherModule(weather)));
    // Navigator.push(
    //     context, SlideRightRoute(page: Injection.getWeatherModule(weather)));
  }
}
