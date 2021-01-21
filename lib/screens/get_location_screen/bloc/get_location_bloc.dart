import 'package:flutter/cupertino.dart';
import 'package:flutter_weather_bloc/api/current_location_api.dart';
import 'package:flutter_weather_bloc/utils/bloc_utils/base_bloc.dart';
import 'package:geolocator/geolocator.dart';

enum GetLocationBlocEvent { openTabBarScreen }

abstract class IGetLocationBloc extends BlocBase<GetLocationBlocEvent> {
  void getUserLocation();
}

class GetLocationBloc extends IGetLocationBloc {
  final ICurrentLocationApi currentLocation;

  GetLocationBloc({@required this.currentLocation});

  @override
  void getUserLocation() async {
    Position position = await currentLocation.determinePosition();
    print(position);
    inUiEvents.add(BlocEvent(type: GetLocationBlocEvent.openTabBarScreen));
  }
}
