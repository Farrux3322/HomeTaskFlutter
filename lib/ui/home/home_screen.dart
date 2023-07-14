import 'package:default_project/data/network/api_provider.dart';
import 'package:flutter/material.dart';

import '../../data/models/place_holder_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var pokemons;
  ApiProvider apiProvider = ApiProvider();

  _init()async{
    print(await apiProvider.getPokemon());
    pokemons = await apiProvider.getPokemon();
    setState(()  {
    });
    print(pokemons);
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 60,),
          Center(child: Image.asset("assets/images/logo.png",width: 252,height: 88,)),
          SizedBox(height: 20,),
          Container(
            width: 296,
            height: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Color(0xFFE5E5E5)
            ),
            child: Center(child: Text("Buscar Pokémon",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Color(0xFF838282)),)),
          ),
          Expanded(
            child: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),children: [
              ...List.generate(pokemons.length, (index){
                return Stack(
                  children: [
                    SizedBox(height: 50,),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 117,
                        width: 177,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFFFC7CFF)
                        ),
                      ),
                    ),
                    Align(
                        child: Image.network(pokemons[index].img),
                    alignment: Alignment.topCenter,),
                  ],
                );
              })
            ],),
          )
        ],
      ),
    );
  }
}
