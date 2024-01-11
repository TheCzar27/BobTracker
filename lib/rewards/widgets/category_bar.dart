import 'package:flutter/material.dart';

class CategoryBar extends StatefulWidget {
  @override
  _CategoryBarState createState() => _CategoryBarState();
}

class _CategoryBarState extends State<CategoryBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
          child: TabBar(
            unselectedLabelColor: Color.fromRGBO(37, 37, 37, 0.4),
            isScrollable: true,
            labelColor: Colors.white,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(0, 157, 249, 1.0),
                  Color.fromRGBO(0, 157, 249, 1.0),
                  Color.fromRGBO(0, 157, 249, 1.0),
                  Color.fromRGBO(0, 157, 249, 1.0),
                  Color.fromRGBO(0, 157, 249, 1.0),
                  Color.fromRGBO(0, 157, 249, 1.0),
                ],
              ),
            ),
            tabs: [
              Tab(
                text: 'All Product',
              ),
              Tab(
                text: 'Recommended',
              ),
              Tab(
                text: 'New Product',
              ),
              Tab(
                text: 'Popular',
              ),
            ],
          ),
        ));
  }
}
