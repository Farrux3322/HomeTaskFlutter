import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../../../utils/constants.dart';



class MyAppBar extends StatefulWidget {
  const MyAppBar({super.key, required this.voidCallback});

  final VoidCallback voidCallback;

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {

  TextEditingController controller = TextEditingController();

  bool check = false;
  bool check1 = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ZoomTapAnimation(
            onTap: (){
              setState(() {
                check = !check;
                check1 = !check1;
              });
            },
            child: Visibility(
                visible: check1,
                child: SvgPicture.asset("assets/svg/search.svg",width: 32,height: 32,))),
        Visibility(
          visible: check,
          child: Row(
            children: [
              SizedBox(
                width: 200,
                height: 30,
                child: TextField(
                  cursorHeight: 22,
                  controller: controller,
                  style: TextStyle(fontSize: 16,color: Colors.black),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(width: 6,),
              TextButton(onPressed: (){
                setState(() {
                  query = controller.text;
                  print(query);
                  widget.voidCallback.call();
                  controller.clear();
                  // query = "Tashkent";
                  check = !check;
                  check1 = !check1;
                });
              }, child: Text("Search",style: TextStyle(color: Colors.white),),style: TextButton.styleFrom(
                  backgroundColor: Colors.pinkAccent
              ),)
            ],
          ),
        ),
        ZoomTapAnimation(child: SvgPicture.asset("assets/svg/more.svg",width: 32,height: 32,)),
      ],
    );
  }
}
