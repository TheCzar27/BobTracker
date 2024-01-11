import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
import 'settings.dart';
import 'shop.dart';
import 'rewards/data/data.dart';


class Time extends StatefulWidget {
  final List<bool> daysAvailable;
  Time({super.key, required this.daysAvailable, });

  @override
  _TimeState createState() => _TimeState();
}

class _TimeState extends State<Time> {
  late Timer _timer;
  int _seconds = 0;
  bool _isRunning = false;
  int _points = 0;
  int totalSeconds = 0;
  int totalPoints = 0;



  String get timerText {
    int hours = (_seconds ~/ 3600).floor();
    int minutes = ((_seconds % 3600) ~/ 60).floor();
    int seconds = (_seconds % 60).floor();

    String hoursStr = (hours < 10) ? "0$hours" : hours.toString();
    String minutesStr = (minutes < 10) ? "0$minutes" : minutes.toString();
    String secondsStr = (seconds < 10) ? "0$seconds" : seconds.toString();

    return "$hoursStr:$minutesStr:$secondsStr";
  }

  int get points {
    return totalSeconds;
  }

  void _startTimer() {
    totalSeconds = 0;
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        _seconds++;
        totalSeconds++;
        _points = points;
        totalPoints += 1;
        _saveTotalPoints(totalPoints);
      });
    });
  }


  void _stopTimer() {
    _timer.cancel();
    setState(() {
      _isRunning = false;
      _saveTotalPoints(totalPoints);
    });
  }

  void _resetTimer() {
    _timer.cancel();
    setState(() {
      _seconds = 0;
      _isRunning = false;
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _loadTotalPoints();
  }

  void _loadTotalPoints() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    totalPoints = prefs.getInt('totalPoints') ?? 0;
    setState(() {});
  }

  void _saveTotalPoints(int totalPoints) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('totalPoints', totalPoints);
  }
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
                  MaterialPageRoute(builder: (context) =>  Time(daysAvailable: widget.daysAvailable,)),
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
              onPressed: ()  {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Home(daysAvailable: widget.daysAvailable,))
                    );
              },
            ),

          ],
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bob Bucks: $_points',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              timerText,
              style: TextStyle(fontSize: 48),
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (!_isRunning) {
                      _isRunning = true;
                      _startTimer();
                    }
                  },
                  child: Text('Start'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_isRunning) {
                      _isRunning = false;
                      _stopTimer();
                    }
                  },
                  child: Text('Stop'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () {
                    _resetTimer();
                  },
                  child: Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
}
}





