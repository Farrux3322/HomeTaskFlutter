import 'package:default_project/provider/counter_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabBoxScreen extends StatefulWidget {
  TabBoxScreen({Key? key}) : super(key: key);

  @override
  State<TabBoxScreen> createState() => _TabBoxScreenState();

}

class _TabBoxScreenState extends State<TabBoxScreen> {


  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<CounterProvider>(context,listen: true);
    return Scaffold(
      backgroundColor: Colors.black,
      body: provider.widget,
      bottomNavigationBar: SizedBox(
        height: 110,
        child: BottomNavigationBar(
          backgroundColor: Colors.black,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white60,
          selectedItemColor: Colors.white,
          onTap: (onTab){
            print(onTab);
            provider.getScreen(onTab);
          },
          currentIndex: provider.currentIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.apple, size: 30), label: "1-screen"),
            BottomNavigationBarItem(icon: Icon(Icons.home, size: 30), label: "2-screen"),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.airplane, size: 30), label: "3-screen"),
          ],
        ),
      ),
    );
  }
}
