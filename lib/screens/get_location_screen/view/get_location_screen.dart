import 'package:flutter/material.dart';
import 'package:flutter_weather_bloc/screens/get_location_screen/bloc/get_location_bloc.dart';
import 'package:flutter_weather_bloc/utils/bloc_utils/bloc_provider.dart';

class GetLocationScreen extends StatefulWidget {
  @override
  _GetLocationScreenState createState() => _GetLocationScreenState();
}

class _GetLocationScreenState extends State<GetLocationScreen> {
  IGetLocationBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of(context);
    _bloc.loadBaseState(GetLocationBlocState.initialState);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Temp'),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: StreamBuilder(
            stream: _bloc.outState,
            builder: (BuildContext context,
                AsyncSnapshot<GetLocationBlocState> snapshot) {
              switch (snapshot.data) {
                case GetLocationBlocState.initialState:
                  return FlatButton(
                      onPressed: () => _bloc.getUserLocation(),
                      child: Text('Get Weather for location'));
                  break;
                case GetLocationBlocState.loadingState:
                  return Text('loadingState');
                  break;
                case GetLocationBlocState.errorState:
                  return Text('errorState');
                  break;
                case GetLocationBlocState.successState:
                  return FlatButton(
                      onPressed: () => _bloc.showWeatherModule(),
                      child: Text('ShowWeathrModule'));
                  break;
                default:
                  // assert(false, "Should never reach there");
                  return Container();
                  break;
              }
            },
          ),
        ));
  }
}
