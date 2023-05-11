import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fridge_app/components/containers/list_container.dart';
import 'package:fridge_app/utility/DatabaseManager.dart';
import 'AddIngredients.dart';

import 'data/Recipe.dart';

final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    textStyle: const TextStyle(fontSize: 20, fontFamily: 'CartoonistHand'),
    backgroundColor: const Color(0xFF526dd1));

class Ingredients extends StatefulWidget {
  const Ingredients({super.key});

  @override
  State<StatefulWidget> createState() {
    return _IngredientsState();
  }
}

class _IngredientsState extends State<Ingredients> {
  final _ingredientsRef = FirebaseFirestore.instance.collection('ingredients');
  String _searchQuery = '';

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
                    padding:   EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                        });
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.black12,
                          hintText: 'Search...',
                          hintStyle: const TextStyle(color: Colors.grey),
                          prefixIcon:
                              const Icon(Icons.search, color: Colors.white),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20.0),
                          )),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: StreamBuilder<QuerySnapshot>(
                stream: _ingredientsRef.where('lowerName', isGreaterThanOrEqualTo: _searchQuery.toLowerCase())
                    .where('lowerName', isLessThan: '${_searchQuery.toLowerCase()}z').snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if(snapshot.hasError){
                    return const Text("Something went wrong!");
                  }

                  if(snapshot.connectionState == ConnectionState.waiting){
                    return const Center(
                        child: CircularProgressIndicator()
                    );
                  }

                  // Generate Ingredients Menu, Once Ingredients have been received.
                  return ListContainer(
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          if(!snapshot.hasData || snapshot.data!.docs.isEmpty)
                            const Text("No Ingredients Found!!!")
                          else
                            ...snapshot.data!.docs.map((DocumentSnapshot document) {
                              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                              return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                                  child: Card(
                                      color: const Color(0xFF526dd1),
                                      shadowColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                      child: ListTile(
                                        title: Text(
                                          data['name'],
                                          style: const TextStyle(fontSize: 20, fontFamily: 'CartoonistHand', color: Colors.white),
                                        ),
                                        onTap: () {

                                        },
                                      )
                                  )
                              );
                            }).toList()],
                      )
                  );
                },
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFF36393E),
    );
  }

  void _showIngredientDetails(Ingredient ingredient, String name) {
    final ButtonStyle buttonStyleRed = ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        textStyle: const TextStyle(fontSize: 20, fontFamily: 'CartoonistHand'),
        backgroundColor: Colors.redAccent);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            name,
            style: const TextStyle(
                fontFamily: 'CartoonistHand',
                fontSize: 60,
                color: Colors.white),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  "Quantity: ${ingredient.amount}",
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
