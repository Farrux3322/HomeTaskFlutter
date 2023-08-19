import 'package:default_project/ui/car_item/car_item_screen.dart';
import 'package:default_project/ui/cars/cars_screen.dart';
import 'package:default_project/ui/country/country_screen.dart';
import 'package:default_project/ui/superheros/superheros_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class TabBoxScreen extends StatefulWidget {
  TabBoxScreen({Key? key}) : super(key: key);

  @override
  State<TabBoxScreen> createState() => _TabBoxScreenState();

}

class _TabBoxScreenState extends State<TabBoxScreen> {
  int _currentIndex = 0;

  List<Widget> screens = [];

  @override
  void initState() {
    screens.add(CountryScreen());
    screens.add(CarsScreen());
    screens.add(CarItemScreen());
    screens.add(SuperherosScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: screens[_currentIndex],
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          backgroundColor: Colors.black,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.white60,
          selectedItemColor: Colors.white,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.location_city_outlined, size: 30), label: "Country"),
            BottomNavigationBarItem(icon: Icon(Icons.car_crash_outlined, size: 30), label: "Cars"),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.car_detailed, size: 30), label: "Car Item"),
            BottomNavigationBarItem(icon: Icon(Icons.health_and_safety_rounded, size: 30), label: "Superheros"),
          ],
        ),
      ),
    );
  }
}