import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'RecipeScreen.dart';
import 'components/containers/list_container.dart';

class BrowseRecipes extends StatefulWidget {
  const BrowseRecipes({super.key});

  @override
  State<StatefulWidget> createState() => _BrowseRecipesState();
}

class _BrowseRecipesState extends State<BrowseRecipes> {
  final _recipesRef = FirebaseFirestore.instance.collection('recipes');

  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {

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
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: TextField(
                        onChanged: (value){
                          setState(() {
                            _searchQuery = value;
                          });
                        },
                        style: TextStyle(color: Colors.white),
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
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: SingleChildScrollView(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: _recipesRef.where('lowerName', isGreaterThanOrEqualTo: _searchQuery.toLowerCase())
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

                      // Generate Recipe Menu, Once Recipes have been received.
                      return ListContainer(
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          children: [
                            if(!snapshot.hasData || snapshot.data!.docs.isEmpty)
                              const Text("No Recipes Found!!!")
                            else
                            ...snapshot.data!.docs.map((DocumentSnapshot document) {
                            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                            return Column(children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => RecipeScreen(document))
                                  );
                                },
                                style: buttonStyle,
                                child: ListTile(
                                  title: Text(
                                    data['name'],
                                    style: const TextStyle(fontSize: 20, fontFamily: 'CartoonistHand', color: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20), // Padding
                            ]
                            );
                          }).toList()],
                        )
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: const Color(0xFF36393E));
  }
}
