import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Weather extends Equatable {
  int id;
  int timezone;
  double lat;
  double lon;
  String base;
  String name;

  String mainWeather;
  String description;
  String icon;

  int visibility;
  double temp;
  int pressure;
  int humidity;

  Weather.fromJson(Map<String, dynamic> json) {
    timezone = json['timezone'];
    base = json['base'];
    visibility = json['visibility'];
    id = json['id'];
    name = json['name'];

    final coord = json['coord'];
    lat = coord['lat'];
    lon = coord['lon'];

    final main = json['main'];
    temp = main['temp'];
    pressure = main['pressure'];
    humidity = main['humidity'];

    final weather = json['weather'][0];
    mainWeather = weather['main'];
    description = weather['description'];
    icon = weather['icon'];
  }

  @override
  List<Object> get props => [id];
}
