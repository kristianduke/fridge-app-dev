import 'package:flutter/material.dart';
import 'package:fridge_app/components/containers/list_container.dart';
import 'AddIngredients.dart';
import 'package:intl/intl.dart';

class Ingredient {
  String name;
  String quantity;
  String weight;
  DateTime expiryDate;

  Ingredient(
      {required this.name,
      required this.quantity,
      required this.weight,
      required this.expiryDate});
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
          expiryDate: DateTime.now()));

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
            const SizedBox(height: 20),
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
            const SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      onChanged: (value){
                        setState(() {
                          // Update Search Query Here
                        });
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.black12,
                          hintText: 'Search...',
                          hintStyle: const TextStyle(color: Colors.grey),
                          prefixIcon: const Icon(Icons.search, color: Colors.white),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20.0),
                          )
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Expanded(child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: ListContainer(child: ListView.builder(
                shrinkWrap: true,
                itemCount: _ingredients.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Card(
                      color: const Color(0xFF526dd1),
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: ListTile(
                        title: Text(_ingredients[index].name,
                            style: const TextStyle(
                                fontFamily: 'CartoonistHand', fontSize: 40)),
                        onTap: () {
                          _showIngredientDetails(_ingredients[index]);
                        },
                        textColor: Colors.white,
                      )
                    ),
                  );
                },
              )),
            ))
          ],
        ),
      ),
      backgroundColor: const Color(0xFF36393E),
    );
  }

  void _showIngredientDetails(Ingredient ingredient) {
    final ButtonStyle buttonStyleRed = ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                Text("Expiry Date: ${ingredient.expiryDate}",
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
