import 'package:flutter/material.dart';

import 'BrowseRecipes.dart';
import 'Ingredients.dart';
import 'SuggestedRecipes.dart';

// Firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 33, 33, 33),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(0),
            width: width,
            height: height,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 82, 109, 209),
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(30),
                  child: Text(
                    'Fridge App Title',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 80,
                        color: Colors.white,
                        fontFamily: 'CartoonistHand'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 200, 0),
                  child: SizedBox(
                    width: 120,
                    height: 40,
                    child: Stack(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 2),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        Positioned(
                          top: 10,
                          left: 2,
                          child: Container(
                            width: 115,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                  child: Container(
                    width: width,
                    height: 20,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 33, 33, 33),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 200, 0),
                  child: SizedBox(
                    width: 120,
                    height: 40,
                    child: Stack(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 2),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        Positioned(
                          top: 10,
                          left: 2,
                          child: Container(
                            width: 115,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Ingredients()),
                    );
                  },
                  child: const Text(
                    'Ingredients',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'CartoonistHand',
                      fontSize: 50.0,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BrowseRecipes()),
                    );
                  },
                  child: const Text(
                    'Browse Recipes',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'CartoonistHand',
                      fontSize: 50.0,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SuggestedRecipes()),
                    );
                  },
                  child: const Text(
                    'Suggested Recipes',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'CartoonistHand',
                      fontSize: 50.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
