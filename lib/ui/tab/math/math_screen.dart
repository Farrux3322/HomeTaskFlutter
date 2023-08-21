import 'package:default_project/cubits/math/math_cubit.dart';
import 'package:default_project/cubits/math/math_temp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MathScreen extends StatefulWidget {
  const MathScreen({super.key});

  @override
  State<MathScreen> createState() => _MathScreenState();
}

class _MathScreenState extends State<MathScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Math "),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                LengthLimitingTextInputFormatter(3),
              ],
              onChanged: (value) {
                if (value.isNotEmpty) {
                  context.read<MathCubit>().initialA(int.parse(value));
                  context.read<MathCubit>().mathCalc();
                }
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter A"),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                LengthLimitingTextInputFormatter(4),
              ],
              onChanged: (value) {
                if (value.isNotEmpty) {
                  context.read<MathCubit>().initialB(int.parse(value));
                  context.read<MathCubit>().mathCalc();
                }
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter B"),
            ),
            const SizedBox(
              height: 100,
            ),
            BlocBuilder<MathCubit, MathTemp>(builder: (context, state) {
              return Center(
                child: Text(
                  context.read<MathCubit>().state.formatAnswer,
                  style: const TextStyle(fontSize: 32),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
