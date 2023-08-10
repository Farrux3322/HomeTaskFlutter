import 'package:default_project/data/models/model.dart';
import 'package:flutter/material.dart';

class CountryDetail extends StatelessWidget {
  const CountryDetail({super.key, required this.country});
  final Country country;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },icon: Icon(Icons.arrow_back),color: Colors.white,),
        title: Text(country.name,style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(country.capital.toString(),style: const TextStyle(fontSize: 36),),
            const SizedBox(height: 10,),
            Text(country.emoji,style: const TextStyle(fontSize: 200),),
            const SizedBox(height: 10,),
            Text("Phone : ${country.phone}",style: const TextStyle(fontSize: 24),),
            const SizedBox(height: 10,),
            Text("Code : ${country.code}",style: const TextStyle(fontSize: 24),),
            const SizedBox(height: 10,),
            Text("Currency : ${country.currency}",style: const TextStyle(fontSize: 24),),
            const SizedBox(height: 10,),
            Text("Continent Code : ${country.continent.code}",style: const TextStyle(fontSize: 24),),
            const SizedBox(height: 10,),
            Text("Continent Name : ${country.continent.name}",style: const TextStyle(fontSize: 24),),
            const SizedBox(height: 80,),
          ],
        ),
      ),
    );
  }
}
