import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              buttonsWidget(),
              SizedBox(height: 20),
              buttonsWidget(),
              SizedBox(height: 20),
              buttonsWidget(),  
              SizedBox(height: 20),
              buttonsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class buttonsWidget extends StatefulWidget {
  const buttonsWidget({super.key});

  @override
  State<buttonsWidget> createState() => _buttonsWidgetState();
}

class _buttonsWidgetState extends State<buttonsWidget> {
  bool selected = false;

  void pressed() {
    setState(() {
      selected = !selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: selected ? Colors.blue[500]: Colors.blue[50],
        ),
        onPressed: pressed,
        child: Text(
          selected ? "Selected" : "Not Selected",
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}