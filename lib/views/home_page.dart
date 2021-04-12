import 'package:flutter/material.dart';
import 'package:food_up_ui/widgets/CustomTextField.dart';
import 'package:food_up_ui/widgets/all_dishis.dart';

class HomePage extends StatefulWidget {
  static String id = 'HomePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController controller = ScrollController();

  //final ValueListenable<Animation> _valueListenable = Animation.closeTopContainer;
  //bool closeTopContainer = false;
  //bool anamated = Provider.of<Animation>(context).closeTopContainer;
  //bool closeTapController = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            'Food App',
            style: TextStyle(
                color: Colors.redAccent,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
        ),
        leading: GestureDetector(
            onTap: () {}, child: Icon(Icons.menu, color: Colors.grey)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.redAccent,
                ),
                width: 50,
                height: 50,
                child: Icon(
                  Icons.shopping_bag,
                )),
          )
        ],
      ),
      body: Column(children: <Widget>[
        CustomTextField(),
        Expanded(child: AllDishes()),
      ]),
    );
  }
}
