import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'name.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}
class _HomepageState extends State<Homepage> {
  List itemColors = [Colors.grey, Colors.grey, Colors.grey];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context)
  {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("Welcome to Bob Tracker!"),),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: CarouselSlider(
                    items: [
                      for (int i = 0; i < itemColors.length; i++)
                        Container(
                          alignment: Alignment.center,
                          margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                          decoration: BoxDecoration(
                              color: itemColors[i],
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 2,
                                    blurRadius: 8,
                                    offset: Offset(4, 4))
                              ]),
                          child: i == 0 ? Text('Welcome to the Team BOB Fitness App! This app follows three principles in what we call the three R’s: Reminder, Routine, and Reward', style: TextStyle(color: Colors.white, fontSize: 15),)
                              : i == 1 ? Text('Designed to help you achieve your fitness goals by incentivizing you with rewards as you reach your fitness milestones to keep you motivated and engaged! Our goal is to help you establish healthy routines and achieve long-term success.', style: TextStyle(color: Colors.white, fontSize: 15),)
                              : Text('Thank you for considering our app as part of your fitness journey, and we look forward to supporting you on your path to a healthier lifestyle!', style: TextStyle(color: Colors.white, fontSize: 15),),
                        )
                    ],
                    options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          setState(() {
                            print(reason.toString());
                            currentIndex = index;
                          });
                        },
                        autoPlay: true),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < itemColors.length; i++)
                      Container(
                        height: 13,
                        width: 13,
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: currentIndex == i ? Colors.blue : Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 1,
                                  blurRadius: 3,
                                  offset: Offset(2, 2))
                            ]),
                      )],
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            child: const Text('next!'),
            onPressed: (){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) =>  Intro()),
              );
            },
          ),
        )

    );

  }
}