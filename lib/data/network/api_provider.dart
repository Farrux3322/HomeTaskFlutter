import 'dart:convert';

import 'package:default_project/data/models/place_holder_model.dart';
import 'package:http/http.dart';

class ApiProvider{
  static Future getData()async{
    
    Response response = await get(Uri.parse("https://randomuser.me/api/"));
    if(response.statusCode==200){
      return Welcome.fromJson(jsonDecode(response.body));
    }
    
  }
}