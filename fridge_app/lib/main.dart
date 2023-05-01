import 'package:flutter/material.dart';

import 'BrowseRecipes.dart';
import 'FavouriteRecipes.dart';
import 'Ingredients.dart';
import 'SuggestedRecipes.dart';

void main() {
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
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 82, 109, 209),
              borderRadius: BorderRadius.circular(40),
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
                )
              ],
            ),
          ),
        ));
  }
}


// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 33, 33, 33),
//       body: Container(
//         alignment: const Alignment(0, -0.3),
//         padding: const EdgeInsets.all(32),
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//               image: AssetImage('assets/home-screen.png'), fit: BoxFit.contain),
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Padding(
//               padding: EdgeInsets.only(bottom: 120.0),
//               child: Text(
//                 'Fridge App Title',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Color.fromARGB(255, 33, 33, 33),
//                   fontFamily: 'CartoonistHand',
//                   fontSize: 70,
//                 ),
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const Ingredients()),
//                 );
//               },
//               child: const Text(
//                 'Ingredients',
//                 style: TextStyle(
//                   color: Color.fromARGB(255, 33, 33, 33),
//                   fontFamily: 'CartoonistHand',
//                   fontSize: 50.0,
//                 ),
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const FavouriteRecipes()),
//                 );
//               },
//               child: const Text(
//                 'Favourite Recipes',
//                 style: TextStyle(
//                   color: Color.fromARGB(255, 33, 33, 33),
//                   fontFamily: 'CartoonistHand',
//                   fontSize: 50.0,
//                 ),
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const BrowseRecipes()),
//                 );
//               },
//               child: const Text(
//                 'Browse Recipes',
//                 style: TextStyle(
//                   color: Color.fromARGB(255, 33, 33, 33),
//                   fontFamily: 'CartoonistHand',
//                   fontSize: 50.0,
//                 ),
//               ),
//             ),
//             TextButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const SuggestedRecipes()),
//                 );
//               },
//               child: const Text(
//                 'Suggested Recipes',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Color.fromARGB(255, 33, 33, 33),
//                   fontFamily: 'CartoonistHand',
//                   fontSize: 50.0,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }