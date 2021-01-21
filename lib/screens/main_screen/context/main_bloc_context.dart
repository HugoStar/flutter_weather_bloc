import 'package:flutter/material.dart';
import 'package:flutter_weather_bloc/screens/main_screen/bloc/main_bloc.dart';
import 'package:flutter_weather_bloc/screens/main_screen/routes/main_screen_routes.dart';
import 'package:flutter_weather_bloc/utils/bloc_utils/base_bloc.dart';
import 'package:flutter_weather_bloc/utils/bloc_utils/base_bloc_context.dart';

class MainBlocContext extends BlocContextBase<IMainBloc> {
  @override
  void subscribe(IMainBloc bloc, BuildContext context) {
    bloc.outUiEvents.listen((BlocEvent<MainBlocEvents> event) {
      switch (event.type) {
        case MainBlocEvents.openTapBarScreen:
          MainScreenRoutes.showTabBarModule(context);
          break;
        default:
          assert(false, "Should never reach there");
          break;
      }
    });
  }
}
