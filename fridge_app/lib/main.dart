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
      backgroundColor: Color.fromARGB(255, 33, 33, 33),
      body: Container(
        alignment: const Alignment(0, -0.3),
        padding: const EdgeInsets.all(32),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/home-screen.png'), fit: BoxFit.contain),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 120.0),
              child: Text(
                'Fridge App Title',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 33, 33, 33),
                  fontFamily: 'CartoonistHand',
                  fontSize: 70,
                ),
              ),
            ),
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
                  color: Color.fromARGB(255, 33, 33, 33),
                  fontFamily: 'CartoonistHand',
                  fontSize: 50.0,
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
                  color: Color.fromARGB(255, 33, 33, 33),
                  fontFamily: 'CartoonistHand',
                  fontSize: 50.0,
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
                  color: Color.fromARGB(255, 33, 33, 33),
                  fontFamily: 'CartoonistHand',
                  fontSize: 50.0,
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
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 33, 33, 33),
                  fontFamily: 'CartoonistHand',
                  fontSize: 50.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
