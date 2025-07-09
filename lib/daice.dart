import 'package:flutter/material.dart';
import 'dart:math';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  var activediceimage = 'assets/images/dice-1.png';
  int diceNumber = 1;
  int totalSum = 0;

  void rollDice() {
    setState(() {
      diceNumber = Random().nextInt(6) + 1;
      activediceimage = 'assets/images/dice-$diceNumber.png';
      totalSum += diceNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Daiceing'))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              activediceimage,
              width: 200,
              height: 200,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            Text(
              'You rolled: $diceNumber',
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              'Total sum: $totalSum',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: rollDice, child: const Text('Roll Dice')),
          ],
        ),
      ),
    );
  }
}
