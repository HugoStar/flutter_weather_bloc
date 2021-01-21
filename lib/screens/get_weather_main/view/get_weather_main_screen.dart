import 'package:flutter/material.dart';
import 'package:flutter_weather_bloc/screens/get_weather_main/bloc/get_weather_main_bloc.dart';
import 'package:flutter_weather_bloc/utils/bloc_utils/bloc_provider.dart';

class GetWeatherMainScreen extends StatefulWidget {
  @override
  _GetWeatherMainScreenState createState() => _GetWeatherMainScreenState();
}

class _GetWeatherMainScreenState extends State<GetWeatherMainScreen> {
  IGetWeatherMainBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Weather For Loc'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: FlatButton(
          onPressed: () => _bloc.showMeWeather(),
          child: Text('Get Weather'),
        ),
      ),
    );
  }
}
