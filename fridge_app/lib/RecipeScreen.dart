import 'package:flutter/material.dart';

class RecipeScreen extends StatefulWidget {
  const RecipeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyFlutterState();
  }
}

class MyFlutterState extends State<RecipeScreen> {
  @override
  Widget build(BuildContext context) {
    List<bool> favorites = List.generate(20, (index) => false);
    const String recipeName ='Recipe name here';
    final List<String> items =
        List.generate(1, (index) => "$recipeName ${index + 1}");

    final List<String> ingredients = [
      '1 cup flour',
      '1/2 cup sugar',
      '1/2 tsp baking soda',
      '1/4 tsp salt',
      'chicekn wihguiahifghi',
    ];

    final List<String> instructions = [
      '1. Preheat oven to 350°F (175°C).',
      '2. In a large mixing bowl, combine flour, sugar, baking soda, and salt.',
      '3. Add in eggs and milk, and stir until just combined.',
      '4. Pour batter into a greased 9x13 inch baking dish.',
      '5. Bake for 25-30 minutes, or until a toothpick inserted into the center comes out clean.',
      '1. Preheat oven to 350°F (175°C).',
      '2. In a large mixing bowl, combine flour, sugar, baking soda, and salt.',
      '3. Add in eggs and milk, and stir until just combined.',
      '4. Pour batter into a greased 9x13 inch baking dish.',
      '5. Bake for 25-30 minutes, or until a toothpick inserted into the center comes out clean.',
    ];

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: const Text(
            'Fridge App Name',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Column(
                children: List.generate(items.length, (index) {
                  final item = items[index];
                  bool isFavorite = favorites[index];

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        isFavorite = !isFavorite;
                        favorites[index] = isFavorite;
                      });
                    },
                    child: Container(
                      height: 100,
                      color: const Color(0xFF526dd1),
                      margin: const EdgeInsets.all(10),
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              isFavorite ? Icons.star : Icons.star_border,
                              color: isFavorite ? Colors.yellow : Colors.white,
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
                                  fontFamily: 'CartoonistHand',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
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
                              children: ingredients
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
                              children: instructions
                                  .map(
                                    (instruction) => Text(
                                      instruction,
                                      style: const TextStyle(
                                        fontSize: 28,
                                        fontFamily: 'CartoonistHand',
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            )
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
        backgroundColor: const Color(0xFF36393E));
  }
}
