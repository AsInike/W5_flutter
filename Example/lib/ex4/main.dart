import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFFAED672),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: const [
                ScoreCard(cardName: "My score in Flutter"),
                SizedBox(height: 40),
                ScoreCard(cardName: "My score in Dart"),
                SizedBox(height: 40),
                ScoreCard(cardName: "My score in React"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ScoreCard extends StatefulWidget {
  final String cardName;
  const ScoreCard({super.key, required this.cardName});

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  int score = 0;

  Color getColor() {
    if (score <=3) return Colors.green.shade300;
    if (score >= 8) return Colors.green.shade900;
    return Colors.green.shade600;
  }

  double getProgress() {
    if (score <= 0) return 0;
    if (score >= 10) return 1;
    return score / 10;
  }

  void increment() {
    setState(() {
      if (score < 10) score++;
    });
  }

  void decrement() {
    setState(() {
      if (score > 0) score--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      padding: const EdgeInsets.symmetric(vertical: 35),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        children: [
          Text(
            widget.cardName,
            style: const TextStyle(
              fontSize: 28,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: decrement,
                child: const Text(
                  "–",
                  style: TextStyle(fontSize: 40, color: Colors.grey),
                ),
              ),
              GestureDetector(
                onTap: increment,
                child: const Text(
                  "+",
                  style: TextStyle(fontSize: 40, color: Colors.grey),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Stack(
            children: [
              Container(
                width: 320,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade300, width: 3),
                ),
              ),
              Container(
                width: 320 * getProgress(),
                height: 40,
                decoration: BoxDecoration(
                  color: getColor(),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}