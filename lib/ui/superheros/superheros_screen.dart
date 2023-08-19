import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SuperherosScreen extends StatefulWidget {
  const SuperherosScreen({super.key});

  @override
  State<SuperherosScreen> createState() => _SuperherosScreenState();
}

class _SuperherosScreenState extends State<SuperherosScreen> {

  List? jsonList;

  bool isLoading = false;

  getData()async{
    try{

      setState(() {
        isLoading = true;
      });

      Response response = await Dio().get("https://protocoderspoint.com/jsondata/superheros.json");

      setState(() {
        isLoading = false;
      });

      if(response.statusCode==200){
       setState(() {
         jsonList = response.data["superheros"] as List;
         print(jsonList);
       });
      }else{
        print(response.statusCode);
      }

    }catch(error){
      print(error);
    }
  }

  @override
  void initState() {
    getData();

    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Superheros",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: isLoading? Center(child: CircularProgressIndicator(),): Column(
        children: [
          Expanded(child: ListView(
            children: [
              ...List.generate(jsonList!.length, (index){
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 5
                      )
                    ]
                  ),
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    leading: Image.network(jsonList![index]["url"],width: 60,height: 60,),
                    title: Text(jsonList![index]["name"]),
                    subtitle: Text(jsonList![index]["power"]),
                  ),
                );
              })
            ],
          ))
        ],
      ),
    );
  }
}
