import 'package:flutter/material.dart';
import 'AddIngredients.dart';

class Ingredient {
  String name;
  String quantity;
  String weight;

  Ingredient(
      {required this.name, required this.quantity, required this.weight});
}
final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    textStyle: const TextStyle(fontSize: 20, fontFamily: 'CartoonistHand'),
    backgroundColor: const Color(0xFF526dd1));

class Ingredients extends StatefulWidget {
  const Ingredients({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyFlutterState();
  }
}

class MyFlutterState extends State<Ingredients> {
  final List<Ingredient> _ingredients = List.generate(
    15,
        (index) => Ingredient(
      name: 'Ingredient ${index + 1}',
      quantity: '${index + 1} units',
      weight: '${(index + 1) * 10} g',
    ),
  );

  @override
  Widget build(BuildContext context) {


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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddIngredients()),
                    );
                  },
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
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _ingredients.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: ListTile(
                      title: Text(_ingredients[index].name,
                          style: const TextStyle(
                              fontFamily: 'CartoonistHand', fontSize: 40)),
                      onTap: () {
                        _showIngredientDetails(_ingredients[index]);
                      },
                      tileColor: const Color(0xFF526dd1),
                      textColor: Colors.white,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      backgroundColor: const Color(0xFF36393E),
    );
  }

  void _showIngredientDetails(Ingredient ingredient) {
    final ButtonStyle buttonStyleRed = ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        textStyle: const TextStyle(fontSize: 20, fontFamily: 'CartoonistHand'),
        backgroundColor: Colors.redAccent);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            ingredient.name,
            style: const TextStyle(
                fontFamily: 'CartoonistHand',
                fontSize: 60,
                color: Colors.white),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  "Quantity: ${ingredient.quantity}",
                  style: const TextStyle(
                      fontFamily: 'CartoonistHand',
                      fontSize: 30,
                      color: Colors.white),
                ),
                Text("Weight: ${ingredient.weight}",
                    style: const TextStyle(
                        fontFamily: 'CartoonistHand',
                        fontSize: 30,
                        color: Colors.white)),
                ElevatedButton(
                  style: buttonStyleRed,
                  onPressed: () {},
                  child: const Text('Delete'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              style: buttonStyle,
              child: const Text('Close',
                  style: TextStyle(
                      fontFamily: 'CartoonistHand',
                      fontSize: 30,
                      color: Colors.white)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          backgroundColor: const Color(0xFF36393E),
          insetPadding: const EdgeInsets.all(0),
        );
      },
    );
  }
}
