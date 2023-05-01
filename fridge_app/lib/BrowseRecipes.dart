import 'package:flutter/material.dart';

class BrowseRecipes extends StatelessWidget {
  const BrowseRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text(
          'Browse Recipes',
          style: TextStyle(
            fontFamily: 'CartoonistHand',
            fontSize: 40,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 82, 109, 209),
      ),
        backgroundColor: const Color(0xFF36393E)
    );
  }
}