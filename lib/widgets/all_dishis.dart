import 'package:flutter/material.dart';
import 'package:food_up_ui/constants/colors.dart';
import 'package:food_up_ui/models/food_model.dart';
import 'package:food_up_ui/widgets/categories.dart';

// ignore: must_be_immutable
class AllDishes extends StatefulWidget {
  static String id = 'HomePage';
  bool closeTopContainer = false;
  @override
  _AllDishesState createState() => _AllDishesState();
}

class _AllDishesState extends State<AllDishes> {
  List<FoodModel> foodModel;
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;
  List<Widget> itemData = [];

  @override
  void initState() {
    foodModel = FoodData().getData();
    super.initState();
    //getAllDishes();
    controller.addListener(() {
      double value = controller.offset / 120;
      setState(() {
        closeTopContainer = controller.offset > 50;
        topContainer = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 200),
            opacity: closeTopContainer ? 0 : 1,
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                //width: 200,
                alignment: Alignment.topCenter,
                height: closeTopContainer
                    ? 0
                    : MediaQuery.of(context).size.height * .25,
                child: Categories()),
          ),
          // SizedBox(height: 10),
          ListView.builder(
            controller: controller,
            itemCount: foodModel.length,
            itemBuilder: (context, index) {
              if (foodModel.length <= 0) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                double scale = 1.0;
                if (topContainer > 0.5) {
                  scale = index + 0.5 - topContainer;
                  if (scale < 0) {
                    scale = 0;
                  } else if (scale > 1) {
                    scale = 1;
                  }
                }
                return Opacity(
                  opacity: scale,
                  child: Transform(
                      alignment: Alignment.bottomCenter,
                      transform: Matrix4.identity()..scale(scale, scale),
                      child: Align(
                          heightFactor: 0.8,
                          child: GestureDetector(
                              // onTap: () {
                              //   Navigator.of(context).pushNamed(MealPage.id,
                              //       arguments: meal);
                              // },
                              child: Stack(
                            children: [
                              Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: kMainColor, width: 0),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey, blurRadius: 10)
                                    ],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: kMainColor,
                                  ),
                                  // width: 50,
                                  height: 130,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              foodModel[index]
                                                  .category
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              foodModel[index].name.toString(),
                                              style: TextStyle(
                                                  color: Colors.black26,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              foodModel[index].name.toString(),
                                              style: TextStyle(
                                                  color: priceColor,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ]),
                                    ],
                                  )),
                              Positioned(
                                left: 200,
                                bottom: 0,
                                top: 0,
                                child: Container(
                                  width: 130,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    //borderRadius: BorderRadius.all(Radius.circular(60)),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: CircleAvatar(
                                      minRadius: 50,
                                      backgroundImage: AssetImage(
                                          foodModel[index].image.toString()),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )))),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
// void getAllDishes() {
//   var responseList = All;
//   responseList.shuffle();
//   List<Widget> listItems = [];
//   responseList.forEach((item) {
//     listItems.add(Stack(
//       children: [
//         Container(
//             margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//             padding: const EdgeInsets.all(10.0),
//             decoration: BoxDecoration(
//               border: Border.all(color: kMainColor, width: 0),
//               boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)],
//               borderRadius: BorderRadius.all(Radius.circular(20)),
//               color: kMainColor,
//             ),
//             // width: 50,
//             height: 130,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Text(
//                         item['name'],
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.bold),
//                       ),
//                       Text(
//                         item['category'],
//                         style: TextStyle(
//                             color: Colors.black26,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       Text(
//                         item['price'].toString(),
//                         style: TextStyle(
//                             color: priceColor,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ]),
//               ],
//             )),
//         Positioned(
//           left: 200,
//           bottom: 0,
//           top: 0,
//           child: Container(
//             width: 130,
//             height: 200,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               //borderRadius: BorderRadius.all(Radius.circular(60)),
//               color: Colors.white,
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(15.0),
//               child: CircleAvatar(
//                 minRadius: 50,
//                 backgroundImage: AssetImage(item['image']),
//               ),
//             ),
//           ),
//         ),
//       ],
//     ));
//   });
//   var meal = responseList;
//   setState(() {
//     itemData = listItems;
//     itemData.shuffle();
//   });
// }
