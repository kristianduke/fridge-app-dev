import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RecipeScreen extends StatefulWidget {
  final DocumentSnapshot recipeDocument;
  const RecipeScreen(this.recipeDocument, {super.key});

  @override
  State<StatefulWidget> createState() {
    return _RecipeScreenState();
  }
}

class _RecipeScreenState extends State<RecipeScreen> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = widget.recipeDocument.data() as Map<
        String,
        dynamic>;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Text(
          data['name'],
          style: const TextStyle(
            fontFamily: 'CartoonistHand',
            fontSize: 40,
          ),
        ),
        actions:<Widget>[
          IconButton(
            icon: const Icon(Icons.star_border),
            tooltip: 'Favourite',
            onPressed: (){
              // Add Code to Favourite Recipe!
            },
          ),
          const SizedBox(
            width: 15,
          )
        ],
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 82, 109, 209),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'Ingredients:',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'CartoonistHand',
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List<String>.from(data['ingredients'])
                                .map(
                                  (ingredient) => Text(
                                '- $ingredient',
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontFamily: 'CartoonistHand',
                                  color: Colors.white,
                                ),
                              ),
                            )
                                .toList(),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Instructions:',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'CartoonistHand',
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List<String>.from(data['instructions'])
                              .asMap()
                              .map(
                                (index, instruction) => MapEntry(
                                  index,
                                  Text(
                                    '${index + 1} - $instruction \n',
                                    style: const TextStyle(
                                      fontSize: 28,
                                      fontFamily: 'CartoonistHand',
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                            )
                            .values
                            .toList(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        ),
        backgroundColor: const Color(0xFF36393E)
    );
  }
}
