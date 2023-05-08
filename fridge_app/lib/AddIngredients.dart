import 'package:flutter/material.dart';

class AddIngredients extends StatelessWidget {
  const AddIngredients({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20, fontFamily: 'CartoonistHand'),
        backgroundColor: const Color(0xFF526dd1));

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text(
          'Add Ingredient',
          style: TextStyle(
            fontFamily: 'CartoonistHand',
            fontSize: 40,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 82, 109, 209),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Input Ingredient',
                style: TextStyle(
                  fontFamily: 'CartoonistHand',
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'eg. Steak',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Input Quantity',
                style: TextStyle(
                  fontFamily: 'CartoonistHand',
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'eg. 3',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Input Weight/Volume',
                style: TextStyle(
                  fontFamily: 'CartoonistHand',
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'eg. 500g (optional)',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Input Expiry Date',
                style: TextStyle(
                  fontFamily: 'CartoonistHand',
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(40, 0, 40, 20),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: '*calender widget*',
                ),
              ),
            ),
            SizedBox(
              width: 200,
              height: 70,
              child: ElevatedButton(
                style: buttonStyle,
                onPressed: () {},
                child: const Text(
                  'Add',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFF36393E),
    );
  }
}
