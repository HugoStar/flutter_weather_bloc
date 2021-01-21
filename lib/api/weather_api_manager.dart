import 'package:flutter_weather_bloc/api/net_api_manager.dart';
import 'package:flutter_weather_bloc/utils/api_utils/request_type.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

abstract class IWeatherApiManager {
  Future<Response> getWeatherForCityName(String cityName);
  Future<Response> getWeatherForCityId(String id);
  Future<Response> getWeatherForCoordinates(double lat, double lon);
}

class WeatherApiManager extends IWeatherApiManager {
  static const String _apiKey = "d297b4fcef2a106449307b67dbbba4f5";

  NetApiManager _netManager = NetApiManager(http.Client());

  Future<Response> getWeatherForCityName(String cityName) {
    var parameters = {
      'q': cityName,
      'appid': _apiKey,
      'utils': 'metric',
    };
    return _netManager.request(
        requestType: RequestType.GET, path: 'weather', parameter: parameters);
  }

  Future<Response> getWeatherForCityId(String id) {
    var parameters = {
      'id': id,
      'appid': _apiKey,
      'utils': 'metric',
    };
    return _netManager.request(
        requestType: RequestType.GET, path: 'weather', parameter: parameters);
  }

  Future<Response> getWeatherForCoordinates(double lat, double lon) {
    var parameters = {
      'lat': lat,
      'lon': lon,
      'appid': _apiKey,
      'utils': 'metric',
    };
    return _netManager.request(
        requestType: RequestType.GET, path: 'weather', parameter: parameters);
  }
}
