import 'package:flutter/material.dart';

class SuggestedRecipes extends StatelessWidget {
  const SuggestedRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suggested Recipes'),
        centerTitle: true,
        backgroundColor: Colors.blue[600],
      ),
    );
  }
}