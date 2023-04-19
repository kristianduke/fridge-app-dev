import 'package:flutter/material.dart';

class Ingredients extends StatelessWidget {
  const Ingredients({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ingredients'),
        centerTitle: true,
        backgroundColor: Colors.blue[600],
      ),
    );
  }
}