import 'package:flutter/material.dart';

class Ingredients extends StatelessWidget {
  const Ingredients({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20, fontFamily: 'CartoonistHand'),
        backgroundColor: const Color(0xFF526dd1));

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text(
          'Ingredients',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  style: buttonStyle,
                  onPressed: () {},
                  child: const Text('Add'),
                ),
                ElevatedButton(
                  style: buttonStyle,
                  onPressed: () {},
                  child: const Text('Filter A-Z'),
                ),
                ElevatedButton(
                  style: buttonStyle,
                  onPressed: () {},
                  child: const Text('Filter Recent'),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Search',
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 0.0)),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.white,),
                  onPressed: () {},
                ),
              ],
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFF36393E),
    );
  }
}
