import 'package:flutter/material.dart';
import 'package:flutter_weather_bloc/di/injector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_weather_bloc/utils/route_utils/slide_right_route.dart';

class MainScreenRoutes {
  static void showTabBarModule(BuildContext context) {
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (BuildContext context) => Injection.getTabBarModule()));

    Navigator.push(context, FadeRoute(page: Injection.getTabBarModule()));
  }
}
