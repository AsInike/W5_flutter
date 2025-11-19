import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Favorite cards"),
        ),
        body: Column(
          children: const [
            AddToFavorites(),
            AddToFavorites(),
            AddToFavorites(),
          ],
        ),
      ),
    );
  }
}

class AddToFavorites extends StatefulWidget {
  const AddToFavorites({super.key});

  @override
  State<AddToFavorites> createState() => _AddToFavoritesState();
}

class _AddToFavoritesState extends State<AddToFavorites> {
  bool isFavorite = false;

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: .5, color: Colors.grey),
            ),
          ),
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'title',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w800),
                    ),
                    SizedBox(height: 10.0),
                    Text('description'),
                  ],
                ),
              ),
              IconButton(
                onPressed: toggleFavorite,
                icon: Icon(
                  Icons.favorite,
                  color: isFavorite ? Colors.red : Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}