import 'package:flutter/material.dart';
import 'package:food_up_ui/constants/categories_constant.dart';
import 'dart:core';

class Categories extends StatefulWidget {
  const Categories();
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  bool closeTopContainer = false;
  List<Widget> itemData = [];
  @override
  void initState() {
    super.initState();
    getAllDishes();
  }

  // ignore: missing_return
  Widget getAllDishes() {
    var responseList = CategoriesList;

    List<Widget> listItems = [];
    responseList.forEach((item) {
      listItems.add(Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          //height: 50,
          //height: MediaQuery.of(context).size.height * 0.2,
          child: Column(//crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
            Container(
              width: 80,
              // height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                //borderRadius: BorderRadius.all(Radius.circular(60)),
                color: Colors.redAccent,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: CircleAvatar(
                  minRadius: 60,
                  backgroundImage: AssetImage(item['image']),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                //color: kMainColor,
              ),
              child: Text(
                item['name'],
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ]),
        ),
      ));
    });
    setState(() {
      itemData = listItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        // child: FittedBox(
        //   fit: BoxFit.fill,
        child: Container(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: itemData.length,
            itemBuilder: (context, index) {
              return itemData[index];
            },
          ),
        ),
      ),
    );
    //);
  }
}
// return Scaffold(
//   body: Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: SingleChildScrollView(
//       physics: BouncingScrollPhysics(),
//       scrollDirection: Axis.horizontal,
//       child: Row(children: [
//         Column(children: [
//           Container(
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.white,
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: CircleAvatar(
//                 minRadius: 30,
//                 backgroundImage: AssetImage('images/burger.jpg'),
//               ),
//             ),
//           ),
//           Container(
//             height: 50,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(20)),
//               //color: kMainColor,
//             ),
//             child: Text(
//               'Burger',
//               style: TextStyle(
//                   color: priceColor,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//         ]),
//         SizedBox(width: 10),
//         Column(children: [
//           Container(
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.white,
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: CircleAvatar(
//                 minRadius: 30,
//                 backgroundImage: AssetImage('images/pizza.jpg'),
//               ),
//             ),
//           ),
//           Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(20)),
//               //color: kMainColor,
//             ),
//             child: Text(
//               'Pizza',
//               style: TextStyle(
//                   color: priceColor,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//         ]),
//         SizedBox(width: 10),
//         Column(
//           children: [
//             Container(
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: Colors.white,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: CircleAvatar(
//                   minRadius: 30,
//                   backgroundImage: AssetImage('images/pasta.jpg'),
//                 ),
//               ),
//             ),
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(20)),
//                 //color: kMainColor,
//               ),
//               child: Text(
//                 'Pasta',
//                 style: TextStyle(
//                     color: priceColor,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(width: 10),
//         Column(children: [
//           Container(
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.white,
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: CircleAvatar(
//                 minRadius: 30,
//                 backgroundImage: AssetImage('images/sushi.jpg'),
//               ),
//             ),
//           ),
//           Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(20)),
//               //color: kMainColor,
//             ),
//             child: Text(
//               'Sushi',
//               style: TextStyle(
//                   color: priceColor,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//         ]),
//         SizedBox(width: 10),
//         Column(children: [
//           Container(
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Colors.white,
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: CircleAvatar(
//                 minRadius: 30,
//                 backgroundImage: AssetImage('images/shawarma.jpg'),
//               ),
//             ),
//           ),
//           Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(20)),
//               //color: kMainColor,
//             ),
//             child: Text(
//               'Shawarma',
//               style: TextStyle(
//                   color: priceColor,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//         ]),
//       ]),
//     ),
//   ),
// );
