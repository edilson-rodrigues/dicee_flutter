import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          elevation: 0,
          title: Text('Dicee'),
          centerTitle: true,
          backgroundColor: Colors.blue[900],
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  final int maxDicesNumber = 6;
  int result = 2;

  void rollDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(maxDicesNumber) + 1;
      rightDiceNumber = Random().nextInt(maxDicesNumber) + 1;
      result = leftDiceNumber + rightDiceNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          elevation: 0.5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'He gave $result',
              style: TextStyle(
                fontSize: 32,
                color: Color(0xFF212121),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        FlatButton(
          onPressed: () => rollDice(),
          child: Row(
            children: [
              Expanded(
                child: Image.asset(
                  'images/dice$leftDiceNumber.png',
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Image.asset(
                  'images/dice$rightDiceNumber.png',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
