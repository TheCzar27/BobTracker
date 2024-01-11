import 'package:flutter/material.dart';
import 'shop.dart';
import 'time.dart';
import 'Home.dart';
import 'name.dart';
class Settings extends StatefulWidget {
  final List<bool> daysAvailable;
  Settings({super.key, required this.daysAvailable,});


  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) =>  Settings(daysAvailable: widget.daysAvailable,)),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.timer),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) =>  Time(daysAvailable: widget.daysAvailable, )),

                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.shop),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) =>  Shop(daysAvailable: widget.daysAvailable,)),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) =>  Home(daysAvailable: widget.daysAvailable)),
                );
              },
            ),
          ],
        ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
          ),

          const Text(
            'Settings',
            style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),

          //NOTIFICATION CHANGE BUTTON
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: MaterialButton(
                minWidth: double.infinity,
                height: 60,
                child: Text('Notification Settings',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.left),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {}),
          ),

          //CHANGE AVAILABILITY BUTTON
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: MaterialButton(
                minWidth: double.infinity,
                height: 60,
                child: Text('Change Availability',
                    style: TextStyle(fontSize: 20)),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {}),
          ),

          //CHANGE NAME BUTTON
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: MaterialButton(
                minWidth: double.infinity,
                height: 60,
                child: Text('Change Name', style: TextStyle(fontSize: 20)),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {}),
          ),
        ],
      ),
    );
  }
}


