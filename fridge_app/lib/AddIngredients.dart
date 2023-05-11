import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AddIngredients extends StatefulWidget {
  const AddIngredients({super.key});

  @override
  State<AddIngredients> createState() => AddIngredientsState();
}

class AddIngredientsState extends State<AddIngredients> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 20, fontFamily: 'CartoonistHand'),
        backgroundColor: const Color(0xFF526dd1));

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: const Text(
          'Add Ingredient',
          style: TextStyle(
            fontFamily: 'CartoonistHand',
            fontSize: 40,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 82, 109, 209),
      ),
      body: SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Input Ingredient',
                style: TextStyle(
                  fontFamily: 'CartoonistHand',
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'eg. Steak',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Input Quantity',
                style: TextStyle(
                  fontFamily: 'CartoonistHand',
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'eg. 3',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Input Weight/Volume',
                style: TextStyle(
                  fontFamily: 'CartoonistHand',
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 0),
              child: TextField(
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                  hintText: 'eg. 500g (optional)',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Input Expiry Date',
                style: TextStyle(
                  fontFamily: 'CartoonistHand',
                  fontSize: 32,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: 0, horizontal: width * 0.1),
              child: Container(
                color: Colors.white,
                child: TableCalendar(
                  headerStyle: const HeaderStyle(
                      formatButtonVisible: false, titleCentered: true),
                  availableGestures: AvailableGestures.all,
                  selectedDayPredicate: (day) => isSameDay(day, today),
                  focusedDay: today,
                  firstDay: DateTime.utc(2023, 01, 01),
                  lastDay: DateTime.utc(2050, 12, 31),
                  onDaySelected: _onDaySelected,
                ),
              ),
            ),
            SizedBox(
              width: 200,
              height: 70,
              child: ElevatedButton(
                style: buttonStyle,
                onPressed: () {},
                child: const Text(
                  'Add',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
          ],
        ),
      ),
      ),
      backgroundColor: const Color(0xFF36393E),
    );
  }
}
