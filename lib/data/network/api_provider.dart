import 'dart:convert';
import 'dart:io';
import 'package:default_project/data/models/user_model.dart';
import 'package:default_project/status/universal_data.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
   Future<UniversalData> getAllUsers() async {
    Uri uri = Uri.parse("https://jsonplaceholder.typicode.com/albums");
    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        return UniversalData(
            data: (jsonDecode(response.body) as List?)
                    ?.map((e) => UserModel.fromJson(e))
                    .toList() ??
                []);
      }
      return UniversalData(error: "Error");
    } on SocketException {
      return UniversalData(error: "Internet Error!");
    } on FormatException {
      return UniversalData(error: "Format Error!");
    } catch (err) {
      return UniversalData(error: err.toString());
    }
  }
}
