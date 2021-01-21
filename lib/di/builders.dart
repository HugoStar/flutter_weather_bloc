import 'package:flutter_weather_bloc/screens/get_location_screen/bloc/get_location_bloc.dart';
import 'package:flutter_weather_bloc/screens/get_weather_main/bloc/get_weather_main_bloc.dart';
import 'package:flutter_weather_bloc/screens/tab_bar_screen/tab_container_screen.dart';
import 'package:flutter_weather_bloc/utils/bloc_utils/bloc_provider.dart';

typedef TabContainerScreen TabScreenBuilder();
typedef BlocProvider<IGetLocationBloc> GetLocationScreenBuilder();
typedef BlocProvider<IGetWeatherMainBloc> GetWeatherMainScreenBuilder();
