import 'package:default_project/ui/home/widgets/change_color.dart';
import 'package:default_project/ui/home/widgets/change_location.dart';
import 'package:default_project/ui/home/widgets/change_shape.dart';
import 'package:default_project/ui/home/widgets/turn_right.dart';
import 'package:flutter/material.dart';


class AnimationScreen extends StatelessWidget {
  const AnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 150),
            SizedBox(
              height: 80,
              width: 200,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ChangeColorScreen();
                    }));
                  },
                  child: Text('Change color')),
            ),
            SizedBox(height: 50),
            SizedBox(
              height: 80,
              width: 200,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (context) {
                    //   return ChangeLocation();
                    // }));
                  },
                  child: Text('Change location')),
            ),
            SizedBox(height: 50),
            SizedBox(
              height: 80,
              width: 200,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ChangeShapeScreen();
                    }));
                  },
                  child: Text('Change shape')),
            ),
            SizedBox(height: 50),
            SizedBox(
              height: 80,
              width: 200,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return TurnToRight();
                    }));
                  },
                  child: Text('Turn to Right')),
            ),
          ],
        ),
      ),
    );
  }
}
