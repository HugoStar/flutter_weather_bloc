import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_weather_bloc/api/current_location_api.dart';
import 'package:flutter_weather_bloc/api/weather_api_manager.dart';
import 'package:flutter_weather_bloc/models/weather.dart';
import 'package:flutter_weather_bloc/utils/bloc_utils/base_bloc.dart';
import 'package:geolocator/geolocator.dart';

enum GetLocationBlocEvent { showWeatherModule }

enum GetLocationBlocState {
  initialState,
  loadingState,
  errorState,
  successState,
}

abstract class IGetLocationBloc extends BlocBase<GetLocationBlocEvent> {
  void getUserLocation();
  void showWeatherModule();
  void loadBaseState(GetLocationBlocState baseState);
  Stream<GetLocationBlocState> get outState;
}

class GetLocationBloc extends IGetLocationBloc {
  final ICurrentLocationApi _currentLocation;
  final IWeatherApiManager _weatherManager;
  Weather _weather;
  final StreamController<GetLocationBlocState> _stateController =
      StreamController<GetLocationBlocState>();

  Sink<GetLocationBlocState> get _inState => _stateController.sink;
  Stream<GetLocationBlocState> get outState => _stateController.stream;

  GetLocationBloc(
      {@required ICurrentLocationApi currentLocation,
      @required IWeatherApiManager weatherManager})
      : _currentLocation = currentLocation,
        _weatherManager = weatherManager;

  @override
  void dispose() {
    _stateController.close();
    super.dispose();
  }

  @override
  void getUserLocation() async {
    _inState.add(GetLocationBlocState.loadingState);
    Position position = await _currentLocation.determinePosition();
    final response = await _weatherManager.getWeatherForCoordinates(
        position.latitude, position.longitude);
    Weather weather = Weather.fromJson(jsonDecode(response.body));
    _weather = weather;
    _inState.add(GetLocationBlocState.successState);
  }

  @override
  void loadBaseState(GetLocationBlocState baseState) {
    _inState.add(baseState);
  }

  @override
  void showWeatherModule() {
    inUiEvents.add(BlocEvent(
        type: GetLocationBlocEvent.showWeatherModule,
        parameters: {'weather': _weather}));
  }
}
