import 'dart:convert';

import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../utils/api_utils/nothing.dart';
import '../utils/api_utils/request_type.dart';
import '../utils/api_utils/request_type_exception.dart';

class NetApiManager {
  static const String _baseUrl = "https://api.openweathermap.org/data/2.5/";
  final Client _client;

  NetApiManager(this._client);

  Future<Response> request(
      {@required RequestType requestType,
      @required String path,
      String token,
      dynamic parameter = Nothing}) async {
    Map<String, String> headers = {'Content-Type': 'application/json'};

    if (token != null) {
      headers['Authorization'] = 'Token token=$token';
    }

    switch (requestType) {
      case RequestType.GET:
        String params = '';
        if (parameter != null) {
          params = _convertParams(parameter);
        }
        return _client.get("$_baseUrl/$path$params", headers: headers);
      case RequestType.POST:
        return _client.post("$_baseUrl/$path",
            headers: headers, body: json.encode(parameter));
      case RequestType.DELETE:
        String params = '';
        if (parameter != null) {
          params = _convertParams(parameter);
        }
        return _client.delete("$_baseUrl/$path$params", headers: headers);
      case RequestType.PUT:
        return _client.put("$_baseUrl/$path", headers: headers);
      default:
        return throw RequestTypeNotFoundException(
            "The HTTP request mentioned is not found");
    }
  }

  String _convertParams(dynamic params) {
    String paramsString = '?';
    params.forEach((key, value) {
      paramsString += '$key=$value&';
    });
    paramsString = paramsString.substring(0, paramsString.length - 1);
    return paramsString;
  }
}
