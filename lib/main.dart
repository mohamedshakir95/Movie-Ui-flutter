import 'package:flutter/material.dart';
import 'package:food_up_ui/views/home_page.dart';
import 'package:food_up_ui/views/meel_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: HomePage.id,
        routes: {
          HomePage.id: (context) => HomePage(),
          MealPage.id: (context) => MealPage(),
        });
  }
}
