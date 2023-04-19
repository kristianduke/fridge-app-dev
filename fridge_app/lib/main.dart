import 'package:flutter/material.dart';

import 'BrowseRecipes.dart';
import 'FavouriteRecipes.dart';
import 'Ingredients.dart';
import 'SuggestedRecipes.dart';

void main() {
  runApp(const MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fridge App thing'),
        centerTitle: true,
        backgroundColor: Colors.blue[600],
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/home-screen.png'), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Ingredients()),
                );
              },
              child: const Text(
                'Ingredients',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.black,
                  fontSize: 40.0,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FavouriteRecipes()),
                );
              },
              child: const Text(
                'Favourite Recipes',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.black,
                  fontSize: 40.0,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BrowseRecipes()),
                );
              },
              child: const Text(
                'Browse Recipes',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.black,
                  fontSize: 40.0,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SuggestedRecipes()),
                );
              },
              child: const Text(
                'Suggested Recipes',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.black,
                  fontSize: 40.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
