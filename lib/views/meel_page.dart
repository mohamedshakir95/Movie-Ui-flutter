import 'package:flutter/material.dart';

class MealPage extends StatefulWidget {
  static String id = 'MealPage';
  @override
  _MealPageState createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  @override
  Widget build(BuildContext context) {
    var meal = ModalRoute.of(context).settings.arguments;
    return Container(
      color: Colors.red,
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              meal,
            ],
          ),
        ],
      ),
    );
  }
}
