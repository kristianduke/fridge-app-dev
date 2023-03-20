import 'package:flutter/material.dart';


class FavouriteRecipes extends StatelessWidget {
  const FavouriteRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Recipes'),
        centerTitle: true,
        backgroundColor: Colors.blue[600],
      ),
    );
  }
}