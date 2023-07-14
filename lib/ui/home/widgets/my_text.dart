import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class MyText extends StatefulWidget {
  const MyText({Key? key, required this.text1, required this.text2}) : super(key: key);

  final String text1;
  final String text2;


  @override
  State<MyText> createState() => _MyTextState();
}

class _MyTextState extends State<MyText> {
  bool check1 = true;
  bool check2 = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ZoomTapAnimation(
            onTap: (){
              setState(() {
                check1 = true;
                check2 = false;
              });
            },
            child: Text(widget.text1,style: check1?TextStyle(fontSize: 24,fontWeight: FontWeight.w700,color: Color(0xFF313341)) : TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xFFD6996B)),)),
        SizedBox(width: 15,),
        ZoomTapAnimation(
            onTap: (){
              setState(() {
                check1 = false;
                check2 = true;
              });
            },
            child: Text(widget.text2,style: check2?TextStyle(fontSize: 24,fontWeight: FontWeight.w700,color: Color(0xFF313341)) :TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xFFD6996B)),)),
        SizedBox(width: 60,),
        Text("Next 7 Days",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Color(0xFFD6996B)),),
        SizedBox(width: 15,),
        SvgPicture.asset("assets/svg/arrow.svg",width: 32,),
      ],
    );
  }
}
