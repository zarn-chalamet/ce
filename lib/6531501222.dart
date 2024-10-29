import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const LabTest());
}

// ignore: camel_case_types
class LabTest extends StatefulWidget {
  const LabTest({super.key});

  @override
  State<LabTest> createState() => _LabtestState();
}

// ignore: camel_case_types
class _LabtestState extends State<LabTest> {
  int _p1RandomNumber = Random().nextInt(10);

  int _p2RandomNumber = Random().nextInt(10);

  int p1coin = 0;
  int p2coin = 0;

  String message1 = '';
  String message2 = '';
  String message3 = "Let start to collect coins!";
  String message4 = '';

  void _p1Collect() {
    setState(() {
      message3 = 'Player 1 collects $_p1RandomNumber';

      p1coin = p1coin + _p1RandomNumber;
      message2 = '$p1coin';

      if (p1coin > 5){
        message4 = 'Player 1 wins!';
      }
    });
  }

  void _p2Collect() {
    setState(() {
      message3 = 'Player 2 collects $_p2RandomNumber';

      p2coin = p2coin + _p2RandomNumber;
      message2 = '$p2coin';

      if (p1coin > p2coin) {
        message4 = 'Player 1 wins!';
      } else if (p1coin == p2coin) {
        message4 = 'draw';
      } else {
        message4 = 'Player 2 wins!';
      }
    });
  }

  void _replay() {
    setState(() {
      p1coin = 0;
      p2coin = 0;
      _p1RandomNumber = Random().nextInt(10);
      _p2RandomNumber = Random().nextInt(10);
      message3 = "Let's the fight start";
      message4 = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Treasure Game',
            style: TextStyle(color: Colors.yellow, fontSize: 18),
          ),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                children: [
                  const Text('Total coins'),
                  Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 5; i++)
                                Icon(
                                  Icons.paid,
                                  color:
                                      i > p1coin+p2coin-6 ? Colors.yellow : Colors.black,
                                ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 5; i++)
                                Icon(
                                  Icons.paid,
                                  color:
                                      i > p1coin+p2coin-1 ? Colors.yellow : Colors.black,
                                ),
                      ],
                    ),
                  ]
                )
              ),
                ],
              ),
              
              
              Row(
                children: [
                  //player 1
                  Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          const Text('Player 1'),
                          Container(
                            width: 100,
                            height: 130,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/dig1.png'), 
                                ),
                              ),
                          ),         
                          Text('$p1coin coins'),
                          ElevatedButton(
                            onPressed: _p1Collect,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red, // Background color
                            ),
                            child: const Text('Collect'),
                          ),
                          
                        ],
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  //player 2
                  Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          const Text('Player 2'),
                          Container(
                            width: 100,
                            height: 130,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/dig2.png'), 
                                ),
                              ),
                          ),         
                          Text('$p2coin coins'),
                          ElevatedButton(
                            onPressed: _p2Collect,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue, // Background color
                            ),
                            child: const Text('Collect'),
                          ),
                        ],
                      )),
                ],
              ),

              
              const SizedBox(
                height: 16,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text(message3)]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text(message4)]),

              
              const SizedBox(
                height: 16,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ElevatedButton(
                  onPressed: _replay, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Background color
                  ),
                  child: const Text('Replay'))
              ])
              // Restet
            ],
          ),
        ),
      ),
    );
  }
}
