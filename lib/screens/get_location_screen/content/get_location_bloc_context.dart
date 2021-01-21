import 'package:flutter/material.dart';
import 'package:flutter_weather_bloc/models/weather.dart';
import 'package:flutter_weather_bloc/screens/get_location_screen/bloc/get_location_bloc.dart';
import 'package:flutter_weather_bloc/screens/get_location_screen/routes/get_location_routes.dart';
import 'package:flutter_weather_bloc/utils/bloc_utils/base_bloc.dart';
import 'package:flutter_weather_bloc/utils/bloc_utils/base_bloc_context.dart';

class GetLocationBlocContext extends BlocContextBase<IGetLocationBloc> {
  @override
  void subscribe(IGetLocationBloc bloc, BuildContext context) {
    bloc.outUiEvents.listen((BlocEvent<GetLocationBlocEvent> event) {
      switch (event.type) {
        case GetLocationBlocEvent.showWeatherModule:
          Weather _weather = event.parameters['weather'];
          GetLocationRoutes.showWeatherModule(context, _weather);
          break;
        default:
          assert(false, "Should never reach there");
          break;
      }
    });
  }
}
