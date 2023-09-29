import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.pink,
        appBar: AppBar(
          title: const Text('Dice'),
          backgroundColor: Colors.pink,
        ),
        body: DiceScreen(),
      ),
    );
  }
}

class DiceScreen extends StatefulWidget {
  const DiceScreen({super.key});

  @override
  State<DiceScreen> createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  late int leftDice;
  late int rightDice;

  @override
  void initState() {
    leftDice = Random().nextInt(6) + 1;
    rightDice = Random().nextInt(6) + 1;
  }

  void randomNumber() {
    setState(() {
      leftDice = Random().nextInt(6) + 1;
      rightDice = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
            onTap: randomNumber,
            child: Container(
              color: Colors.transparent,
            )),
        Center(
          child: Row(
            children: [
              Expanded(
                  child: TextButton(
                      onPressed: randomNumber,
                      child: Image.asset('images/dice$leftDice.png'))),
              Expanded(
                  child: TextButton(
                      onPressed: randomNumber,
                      child: Image.asset('images/dice$rightDice.png'))),
            ],
          ),
        ),
      ],
    );
  }
}
