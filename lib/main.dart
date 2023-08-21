import 'package:default_project/cubits/login/login_cubit.dart';
import 'package:default_project/cubits/math/math_cubit.dart';
import 'package:default_project/cubits/tab/tab_cubit.dart';
import 'package:default_project/ui/tab/tab_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (_) => MathCubit(),
        lazy: false,
      ),
      BlocProvider(
        create: (_) => LoginCubit(),
        lazy: false,
      ),
      BlocProvider(
        create: (_) => TabCubit(),
        lazy: false,
      ),

    ], child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: TabScreen(),
    );
  }
}
