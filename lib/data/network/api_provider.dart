import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';
import '../models/main/weather_main_model.dart';
import '../models/universal_data.dart';


class ApiProvider {
  static Future<UniversalData> getMainWeatherDataByLatLong({
    required double lat,
    required double long,
  }) async {
    Uri uri = Uri.parse(
        "$baseUrl/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKeyForMain");

    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        return UniversalData(
            data: WeatherMainModel.fromJson(jsonDecode(response.body)));
      }

      return UniversalData(error: "Error!");
    } catch (err) {
      return UniversalData(error: err.toString());
    }
  }

  static Future<UniversalData> getMainWeatherDataByQuery(
      {required String query}) async {

    Uri uri = Uri.parse("$baseUrl/data/2.5/weather?q=$query&appid=$apiKeyForMain");

    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        return UniversalData(
            data: WeatherMainModel.fromJson(jsonDecode(response.body)));
      }

      return UniversalData(error: "Error!");
    } catch (err) {
      return UniversalData(error: err.toString());
    }

  }
}