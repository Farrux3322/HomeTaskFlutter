import 'package:flutter/material.dart';

class ChangeLocation extends StatefulWidget {
  const ChangeLocation({Key? key}) : super(key: key);

  @override
  State<ChangeLocation> createState() => _ChangeLocationState();
}

class _ChangeLocationState extends State<ChangeLocation> {
  int selected = 0;
  double containerX = 0;
  double containerY = 0;

  final List<Color> colors = [
    Colors.green,
    Colors.orange,
  ];

  final List<String> text = ['Green', 'Orange'];

  void _changeColor() {
    setState(() {
      selected = (selected + 1) % colors.length;
    });
  }

  void _changePosition(String direction) {
    setState(() {
      switch (direction) {
        case 'up':
          containerY = -155;
          containerX = 0;
          break;
        case 'down':
          containerY = 120;
          containerX = 0;
          break;
        case 'left':
          containerX = -100;
          containerY = 0;
          break;
        case 'right':
          containerX = 100;
          containerY = 0;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Change color"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 350,
            child: Center(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: AnimatedContainer(
                      height: 150,
                      width: 150,
                      curve: Curves.linear,
                      duration: const Duration(seconds: 1),
                      transform: Matrix4.translationValues(containerX, containerY, 1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: colors[selected],
                      ),
                      child: Center(
                        child: Text(
                          text[selected],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          FloatingActionButton(
            onPressed: () => _changePosition('up'),
            backgroundColor: Colors.blue,
            child: Icon(Icons.keyboard_arrow_up, size: 50),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FloatingActionButton(
                onPressed: () => _changePosition('left'),
                backgroundColor: Colors.blue,
                child: Icon(Icons.keyboard_arrow_left, size: 50),
              ),
              FloatingActionButton(
                onPressed: () => _changePosition('right'),
                backgroundColor: Colors.blue,
                child: Icon(Icons.keyboard_arrow_right, size: 50),
              ),
            ],
          ),
          FloatingActionButton(
            onPressed: () => _changePosition('down'),
            backgroundColor: Colors.blue,
            child: Icon(Icons.keyboard_arrow_down, size: 50),
          ),
        ],
      ),
    );
  }
}