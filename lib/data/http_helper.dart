import 'package:flutter_app1/data/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpHelper{
  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = '1bb0695d2e5ddb3211f8df4399781a4c';

  Future<Weather> getWeather(String location) async{
    Map<String, dynamic> parameters = {'q': location, 'appId':apiKey};
    Uri uri = Uri.https(authority, path, parameters);
    http.Response response = await http.get(uri);
    Map<String, dynamic> data = json.decode(response.body);

    Weather weather = Weather.fromJson(data);
    return weather;
  }

}