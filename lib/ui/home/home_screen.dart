import 'package:default_project/providers/calculator_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var provider = Provider.of<CalculatorProvider>(context,listen: false);

    TextEditingController number1 = TextEditingController();
    TextEditingController number2 = TextEditingController();


    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("My Calculator",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 30),
          child: Column(
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.blueAccent,
                ),
                child: Center(child:  Consumer<CalculatorProvider>(
                  builder: (context,answer,child){
                    return answer.getAnswer() !=0?
                    Text(
                      answer.getAnswer().toString(),
                      style: const TextStyle(fontSize: 45,color: Colors.white),
                    ) : const SizedBox();
                  },
                ),),
              ),
              const SizedBox(height: 100,),
              TextField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  LengthLimitingTextInputFormatter(5),
                ],
                controller: number1,
                keyboardType: TextInputType.number,
                style:const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  label: Text("Number One",style: TextStyle(color: Colors.white),),
                  border: OutlineInputBorder(),
                  focusColor: Colors.red,
                ),
              ),
              const SizedBox(height: 40,),
              TextField(
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  LengthLimitingTextInputFormatter(5),
                ],
                controller: number2,
                keyboardType: TextInputType.number,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    label: Text("Number Two",style: TextStyle(color: Colors.white),),
                    border: OutlineInputBorder(),
                    focusColor: Colors.red
                ),
              ),
              Row(
                children: [
                  const Spacer(),
                  TextButton(onPressed: (){
                  number2.clear();
                  number1.clear();
                  provider.sumOfNumbers(0,0);
                  },style: TextButton.styleFrom(
                    backgroundColor: Colors.blueAccent
                  ), child: const Text("Clear",textAlign: TextAlign.right,style: TextStyle(color: Colors.white),),),
                ],
              ),
              const SizedBox(height: 60,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 60,
                    child: TextButton(onPressed: (){
                      if(number1.text.isNotEmpty && number2.text.isNotEmpty){
                        provider.add(int.parse(number1.text),int.parse(number2.text));
                      }else{
                        Fluttertoast.showToast(
                          msg: "Iltimos ikkala sondi ham kiriting",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                        );
                      }
                    },style: TextButton.styleFrom(
                      backgroundColor: Colors.greenAccent
                    ), child: const Text("Add",style: TextStyle(color: Colors.white),),),
                  ),
                  SizedBox(
                    height: 60,
                    child: TextButton(onPressed: (){
                      if(number1.text.isNotEmpty && number2.text.isNotEmpty){
                        provider.subtraction(int.parse(number1.text),int.parse(number2.text));
                      }else{
                        Fluttertoast.showToast(
                          msg: "Iltimos ikkala sondi ham kiriting",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                        );
                      }
                    },style: TextButton.styleFrom(
                        backgroundColor: Colors.greenAccent
                    ), child: const Text("Subtraction",style: TextStyle(color: Colors.white),),),
                  ),
                  SizedBox(
                    height: 60,
                    child: TextButton(onPressed: (){
                      if(number1.text.isNotEmpty && number2.text.isNotEmpty){
                        provider.multiplication(int.parse(number1.text),int.parse(number2.text));
                      }else{
                        Fluttertoast.showToast(
                          msg: "Iltimos ikkala sondi ham kiriting",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                        );
                      }
                    },style: TextButton.styleFrom(
                        backgroundColor: Colors.greenAccent
                    ), child: const Text("Multiplication",style: TextStyle(color: Colors.white),),),
                  ),
                  SizedBox(
                    height: 60,
                    child: TextButton(onPressed: (){
                      if(number1.text.isNotEmpty && number2.text.isNotEmpty){
                        provider.division(int.parse(number1.text),int.parse(number2.text));
                      }else{
                        Fluttertoast.showToast(
                          msg: "Iltimos ikkala sondi ham kiriting",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                        );
                      }
                    },style: TextButton.styleFrom(
                        backgroundColor: Colors.greenAccent
                    ), child: const Text("Division",style: TextStyle(color: Colors.white),),),
                  ),
                ],
              ),
              const SizedBox(height: 12,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 60,
                    child: TextButton(onPressed: (){
                      if(number1.text.isNotEmpty && number2.text.isNotEmpty){
                        provider.middleArithmetic(int.parse(number1.text),int.parse(number2.text));
                      }else{
                        Fluttertoast.showToast(
                          msg: "Iltimos ikkala sondi ham kiriting",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                        );
                      }
                    },style: TextButton.styleFrom(
                        backgroundColor: Colors.greenAccent
                    ), child: const Text("Middle Arithmetic",style: TextStyle(color: Colors.white),),),
                  ),
                  SizedBox(
                    height: 60,
                    child: TextButton(onPressed: (){
                      if(number1.text.isNotEmpty && number2.text.isNotEmpty){
                        provider.mediumGeometric(int.parse(number1.text),int.parse(number2.text));
                      }else{
                        Fluttertoast.showToast(
                          msg: "Iltimos ikkala sondi ham kiriting",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                        );
                      }
                    },style: TextButton.styleFrom(
                        backgroundColor: Colors.greenAccent
                    ), child: const Text("Medium Geometric",style: TextStyle(color: Colors.white),),),
                  ),
                ],
              ),
              const SizedBox(height: 12,),
              SizedBox(
                height: 60,
                child: TextButton(onPressed: (){
                  if(number1.text.isNotEmpty && number2.text.isNotEmpty){
                    provider.sumOfNumbers(int.parse(number1.text),int.parse(number2.text));
                  }else{
                    Fluttertoast.showToast(
                      msg: "Iltimos ikkala sondi ham kiriting",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.black,
                      textColor: Colors.white,
                    );
                  }
                },style: TextButton.styleFrom(
                    backgroundColor: Colors.greenAccent
                ), child: const Text("Sum Of Numbers",style: TextStyle(color: Colors.white),),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
