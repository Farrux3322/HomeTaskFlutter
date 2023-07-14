import 'package:default_project/data/models/place_holder_model.dart';
import 'package:default_project/data/network/api_provider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  ApiProvider apiProvider = ApiProvider();
  bool isLoading=false;

  Welcome? robots;

  _init()async{
    setState(() {
      isLoading=true;
    });
    robots = await apiProvider.getRobot();
    setState(() {
      isLoading=false;
    });
    print(robots.toString());
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
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Default Project"),
        centerTitle: true,
      ),
      body: isLoading?Center(
        child: CircularProgressIndicator(),
      ):Column(
        children: [
          SizedBox(
            height: 60,
            child: Expanded(child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ...List.generate(10, (index) {
                  return SizedBox(
                    child: Container(
                      margin: EdgeInsets.all(12),
                      width: 100,
                      color: Colors.blue,
                      child: Center(child: Text("${index+1}"),),
                    ),
                  );
                })
              ],
            )),
          ),
          Expanded(
            child: GridView(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.6
            ),
              children: [
                ...List.generate(robots!.data.length, (index) => Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                          colors: [
                            Color(int.parse(robots!.data[index].backgroundGradientColors[0],radix: 16)),
                            Color(int.parse(robots!.data[index].backgroundGradientColors[1],radix: 16)),
                            Color(int.parse(robots!.data[index].backgroundGradientColors[2],radix: 16)),
                            Color(int.parse(robots!.data[index].backgroundGradientColors[3],radix: 16))
                          ]
                      )
                  ),
                  child: Column(
                    children: [
                      Image.network(robots!.data[index].displayIcon),
                      SizedBox(height: 10,),
                      Text("Name: ${robots!.data[index].displayName}"),
                      SizedBox(height: 10,),
                      Text("Devoloper: ${robots!.data[index].developerName}"),
                      SizedBox(height: 10,),
                      Text("Slot: ${robots!.data[index].developerName}"),
                    ],
                  ),
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
