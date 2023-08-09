import 'dart:convert';
import 'package:default_project/data/models/dynamic_view.dart';
import 'package:default_project/data/models/universal_data.dart';
import 'package:http/http.dart';

class ApiProvider{
  Future getDynamicView() async {
    Response response = await get(Uri.parse('https://dynamic-view-api.free.mockoapp.net/views'));
    if(response.statusCode==200){
      return UniversalData(
          data: (jsonDecode(response.body)["dynamic_views"] as List?)
              ?.map((e) => DynamicView.fromJson(e))
              .toList() ??
              []);
    }
    throw Exception();
  }
}