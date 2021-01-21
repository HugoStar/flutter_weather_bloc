import 'package:flutter/material.dart';
import 'package:flutter_weather_bloc/di/injector.dart';

void main() {
  Injection.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeatherApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Injection.getCompositionRoot(),
    );
  }
}
