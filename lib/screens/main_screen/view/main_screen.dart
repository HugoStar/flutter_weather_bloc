import 'package:flutter/material.dart';
import 'package:flutter_weather_bloc/screens/main_screen/bloc/main_bloc.dart';
import 'package:flutter_weather_bloc/utils/bloc_utils/bloc_provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  IMainBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () => _bloc.showTabBar(),
          child: Text('Show tab bar'),
        ),
      ),
    );
  }
}
