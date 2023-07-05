import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:apis/models/weathers.dart';

class WeatherApiCalling {
  Future<Weather> getCurrentlocation(String location ) async {
    var endpoint = Uri.parse(
        "http://api.weatherapi.com/v1/current.json?key=e9fd06b823cf4de482745455230307&q=india&aqi=no");
    var response = await http.get(endpoint);
    var body = jsonDecode(response.body);
    // Weather weather = Weather.fromJson(body);
    print(Weather.fromJson(body).cityName);
    return Weather.fromJson(body);
  }
}
