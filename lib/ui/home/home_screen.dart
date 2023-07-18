import 'package:default_project/data/models/place_holder_model.dart';
import 'package:default_project/data/network/api_provider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}




class _HomeScreenState extends State<HomeScreen> {

  bool loading = false;

  Welcome? welcome;

  _getMyData()async{
    setState(() {
      loading = true;
    });
    welcome = await ApiProvider.getData();

    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    _getMyData();
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
      body: loading? Center(child: CircularProgressIndicator()) : Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(welcome!.results.first.picture.large)),
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.person_2),
                const SizedBox(width: 10),
                Text(welcome!.results.first.name.title,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,),),
                const SizedBox(width: 10),
                Text(welcome!.results.first.name.first,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,),),
                const SizedBox(width: 10,),
                Text(welcome!.results.first.name.last,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700,),),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.location_on),
                const SizedBox(width: 10,),
                Row(
                  children: [
                    SizedBox(width: 290,child: Text("${welcome!.results.first.location.country} ${welcome!.results.first.location.state} ${welcome!.results.first.location.city} ${welcome!.results.first.location.street.name} ${welcome!.results.first.location.street.number}",overflow: TextOverflow.ellipsis,maxLines: 2,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.email),
                SizedBox(width: 10,),
                Text(welcome!.results.first.email,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.person_2),
                SizedBox(width: 10,),
                Row(
                  children: [
                    Text(welcome!.results.first.login.username,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),),
                    SizedBox(width: 20,),
                    Icon(Icons.password),
                    SizedBox(width: 20,),
                    Text(welcome!.results.first.login.password,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500),),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.phone),
                SizedBox(width: 10,),
                Text(welcome!.results.first.phone,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Icon(Icons.person_2_sharp),
                SizedBox(width: 10,),
                Text(welcome!.results.first.registered.age.toString(),style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),),
              ],
            ),
            SizedBox(height: 100,)
          ],
        ),
      ),
    );
  }
}
