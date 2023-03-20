import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fridge App thing'),
        centerTitle: true,
        backgroundColor: Colors.blue[600],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Ingredients',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.black,
                  fontSize: 40.0,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Favourite Recipes',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.black,
                  fontSize: 40.0,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Browse Recipes',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.black,
                  fontSize: 40.0,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
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
