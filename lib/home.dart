import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'settings.dart';
import 'time.dart';
import 'shop.dart';

class Home extends StatefulWidget {
   final List<bool> daysAvailable;


     const Home({Key? key, required this.daysAvailable}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String name;
CalendarFormat form = CalendarFormat.month;
DateTime currentDay = DateTime.now();
DateTime? pointerDay;

@override
void initState(){
  super.initState();
  _loadName();
}
  Future<void> _loadName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? 'Unknown'; // use a default value if the name is not found
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Welcome back $name!'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: ()  {
                Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) =>   Settings(daysAvailable: widget.daysAvailable,)));
              },
            ),
            IconButton(
              icon: const Icon(Icons.timer),
              onPressed: ()  {
                 Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) =>  Time(daysAvailable: widget.daysAvailable, ),), );
              },
            ),
            IconButton(
              icon: const Icon(Icons.shop),
              onPressed: ()  {
                 Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) =>  Shop(daysAvailable: widget.daysAvailable,)),);
              },
            ),
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: ()  {
                Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) =>  Home(daysAvailable: widget.daysAvailable,)),);
              },
            ),
          ],
        ),
      ),
      body: Builder(
        builder: (context) => TableCalendar(
            firstDay: DateTime.utc(2023, 1, 1),
            lastDay: DateTime.utc(2024, 1, 1),

            focusedDay: currentDay,
            calendarFormat: form,
            selectedDayPredicate: (day) => isSameDay(pointerDay, day),
            onDaySelected: (selectedDay, focusedDay){
              setState(() {
                pointerDay = selectedDay;
                currentDay = focusedDay;
              });
            },
            availableGestures: AvailableGestures.all,
            eventLoader: (day){
              if(widget.daysAvailable[day.weekday - 1]){
                return[day];
              } else{
                return [];
              }
            }
        ),
      )
    );
  }


}


