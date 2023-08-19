import 'package:default_project/cubits/tab/tab_cubit.dart';
import 'package:default_project/cubits/tab/tab_state.dart';
import 'package:default_project/ui/tab/login/login_screen.dart';
import 'package:default_project/ui/tab/math/math_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TabCubit,TabState>(builder: (context,state){
        if(state is MathScreenState){
          return MathScreen();
        }
        return LoginScreen();
      }),
      bottomNavigationBar: SizedBox(
        height: 110,
        child: BottomNavigationBar(
          backgroundColor: Colors.black,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.blue,
          selectedItemColor:  Colors.blue,
          onTap: (onTab) {
            context.read<TabCubit>().updateScreen(index: onTab);
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.calculate_outlined, size: 30), label: "Math"),
            BottomNavigationBarItem(
                icon: Icon(Icons.login, size: 30), label: "Login"),

          ],
        ),
      ),
    );
  }
}
