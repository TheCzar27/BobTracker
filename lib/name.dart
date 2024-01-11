import 'package:flutter/material.dart';
import 'availability.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Intro extends StatelessWidget {

  final TextEditingController namePass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //"ENTER YOUR NAME" TEXT

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Enter Your Name',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            //NAME INPUT
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Form(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextField(
                          controller: namePass,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            hintText: 'Enter Name',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (String value) {}),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Text('next!'),
    onPressed: () async {
    final String name = namePass.text;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('name', name);
    Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => Availability(name: name)),
    );
    },
      ));
  }
}
