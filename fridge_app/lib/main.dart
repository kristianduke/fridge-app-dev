import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fridge App'),
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
                'Heres a link',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: Text(
                'Heres another link',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: Text(
                'Heres another link',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: Text(
                'Heres another link',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('click'),
        backgroundColor: Colors.blue[600],
      ),
    );
  }
}
