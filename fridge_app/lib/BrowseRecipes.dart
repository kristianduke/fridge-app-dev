import 'package:flutter/material.dart';
import 'RecipeScreen.dart';

class BrowseRecipes extends StatefulWidget {
  const BrowseRecipes({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyFlutterState();
  }
}

class MyFlutterState extends State<BrowseRecipes> {
  @override
  Widget build(BuildContext context) {
    final List<String> items =
        List.generate(10, (index) => "Insert recipe here ${index + 1}");

// line of code that generates the recipes

    List<bool> favorites = List.generate(20, (index) => false);

    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20, fontFamily: 'CartoonistHand'),
        backgroundColor: const Color(0xFF526dd1));


    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: const Text(
            'Browse Recipes',
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
                    child: const Text('Filter by recent'),
                  ),
                  ElevatedButton(
                    style: buttonStyle,
                    onPressed: () {},
                    child: const Text('Filter A-Z'),
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
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(items.length, (index) {
                      final item = items[index];
                      bool isFavorite = favorites[index];

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            isFavorite = !isFavorite;
                            favorites[index] = isFavorite;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RecipeScreen()),
                          );
                        },
                        child: Container(
                          height: 100,
                          color: const Color(0xFF526dd1),
                          margin: EdgeInsets.all(10),
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(
                                  isFavorite ? Icons.star : Icons.star_border,
                                  color:
                                      isFavorite ? Colors.yellow : Colors.white,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isFavorite = !isFavorite;
                                    favorites[index] = isFavorite;
                                  });
                                },
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 40,
                                        fontFamily: 'CartoonistHand'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: const Color(0xFF36393E));
  }
}
