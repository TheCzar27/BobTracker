import 'package:flutter/material.dart';
import 'home.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
class Availability extends StatefulWidget {
  final String name;

  const Availability({Key? key, required this.name}) : super(key: key);

  @override
  State<Availability> createState() => _AvailabilityState();
}

class _AvailabilityState extends State<Availability> {
  List<bool> daysAvailable = List.filled(7, false);




  //NOTIFICATIONS

  @override
  void initState() {
    super.initState();
    initNotifications();
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<void> initNotifications() async {
    tz.initializeTimeZones();
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('mipmap/ic_launcher');

    final InitializationSettings initializationSettings =
    InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: IOSInitializationSettings());


      await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> scheduleNotificationForDay(DateTime dateTime) async {
    final location = tz.getLocation('America/Detroit');

    final scheduledTime = tz.TZDateTime.from(dateTime, location);
    print('Scheduled Time: $scheduledTime');

    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'workout_channel_id', 'Workout',
        importance: Importance.max, priority: Priority.high, ticker: 'ticker');
    const iOSPlatformChannelSpecifics = IOSNotificationDetails();
    const platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'Today\'s workout!',
        'You have a workout today.',
        tz.TZDateTime.from(dateTime, tz.local),
        platformChannelSpecifics,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
  }

  //NOTIFICATIONS




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Select your availability below ${widget.name}!'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CheckboxListTile(
              value: daysAvailable[0],
              onChanged: (val) {
                setState(() {
                  daysAvailable[0] = val!;
                });
              },
              activeColor: Colors.green,
              title: const Text('Monday'),
            ),
            CheckboxListTile(
              value: daysAvailable[1],
              onChanged: (val) {
                setState(() {
                  daysAvailable[1] = val!;
                });
              },
              activeColor: Colors.green,
              title: const Text('Tuesday'),
            ),
            CheckboxListTile(
              value: daysAvailable[2],
              onChanged: (val) {
                setState(() {
                  daysAvailable[2] = val!;
                });
              },
              activeColor: Colors.green,
              title: const Text('Wednesday'),
            ),
            CheckboxListTile(
              value: daysAvailable[3],
              onChanged: (val) {
                setState(() {
                  daysAvailable[3] = val!;
                });
              },
              activeColor: Colors.green,
              title: const Text('Thursday'),
            ),
            CheckboxListTile(
              value: daysAvailable[4],
              onChanged: (val) {
                setState(() {
                  daysAvailable[4] = val!;
                });
              },
              activeColor: Colors.green,
              title: const Text('Friday'),
            ),
            CheckboxListTile(
              value: daysAvailable[5],
              onChanged: (val) {
                setState(() {
                  daysAvailable[5] = val!;
                });
              },
              activeColor: Colors.green,
              title: const Text('Saturday'),
            ),
            CheckboxListTile(
              value: daysAvailable[6],
              onChanged: (val) {
                setState(() {
                  daysAvailable[6] = val!;
                });
              },
              activeColor: Colors.green,
              title: const Text('Sunday'),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Text('Finish!'),
          onPressed: () async {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => Home(
                    daysAvailable: daysAvailable,
                  )),
            );

            final now = DateTime.now();
            for (int i = 0; i < 7; i++) {
              if (daysAvailable[i]) {
                final selectedDay =
                now.add(Duration(days: i + 1 - now.weekday, seconds: 5));
                await scheduleNotificationForDay(selectedDay);
              }
            }
          },
        ));
  }
}






