import 'package:flutter/material.dart';
import 'package:flutter_weather_bloc/screens/get_location_screen/bloc/get_location_bloc.dart';
import 'package:flutter_weather_bloc/utils/bloc_utils/base_bloc.dart';
import 'package:flutter_weather_bloc/utils/bloc_utils/base_bloc_context.dart';

class GetLocationBlocContext extends BlocContextBase<IGetLocationBloc> {
  @override
  void subscribe(IGetLocationBloc bloc, BuildContext context) {
    bloc.outUiEvents.listen((BlocEvent<GetLocationBlocEvent> event) {
      switch (event.type) {
        case GetLocationBlocEvent.openTabBarScreen:
          print('open tab bar');
          break;
        default:
          assert(false, "Should never reach there");
          break;
      }
    });
  }
}
