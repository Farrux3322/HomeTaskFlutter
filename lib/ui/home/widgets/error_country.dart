import 'package:default_project/ui/home/home_screen.dart';
import 'package:default_project/utils/constants.dart';
import 'package:flutter/material.dart';

class ErrorCountry extends StatelessWidget {
  const ErrorCountry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              const Color(0xFFFEE3BC).withOpacity(0.9),
              const Color(0xFFF39876)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Unday Shahar yo'q",style: TextStyle(fontSize: 40,color: Colors.black45),),
            SizedBox(height: 20,),
            SizedBox(
              width: 200,
              height: 60,
              child: TextButton(onPressed: (){
                query = "Tashkent";
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return HomeScreen();
                }));
              }, child: Text("Retry",style: TextStyle(fontSize: 20,color: Colors.white)),style: TextButton.styleFrom(
                  backgroundColor: Colors.pinkAccent
              ),),
            ),
          ],
        ),
      ),
    );
  }
}
