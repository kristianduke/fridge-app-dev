import 'package:flutter/material.dart';

class BrowseRecipes extends StatelessWidget {
  const BrowseRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Browse Recipes'),
        centerTitle: true,
        backgroundColor: Colors.blue[600],
      ),
    );
  }
}