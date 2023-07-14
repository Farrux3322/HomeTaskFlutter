import 'dart:convert';

import 'package:http/http.dart';

import '../models/place_holder_model.dart';

class ApiProvider{

  Future getPokemon()async{
    Response response = await get(Uri.parse("https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json"));
    if(response.statusCode==200){
      //print( (jsonDecode(response.body)["pokemon"] as List?)?.map((e) => Pokemon.fromJson(e)));
      return (jsonDecode(response.body)["pokemon"] as List?)?.map((e) => Pokemon.fromJson(e)).toList() ?? [];
    }
    throw response.body;
  }
}