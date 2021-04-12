import 'package:food_up_ui/constants/all.dart';

class FoodModel {
  String name, category;
  String price;
  String image;
  FoodModel({
    this.name,
    this.category,
    this.price,
    this.image,
  });

  factory FoodModel.fromJson(Map<String, String> json) {
    return FoodModel(
        name: json['name'].toString(),
        price: json['price'].toString(),
        category: json['category'].toString(),
        image: json['image'].toString());
  }
}

class FoodData {
  List<FoodModel> getData() {
    var foodData = All;
    List<FoodModel> foodModel = [];
    for (var item in foodData) {
      foodModel.add(
        FoodModel(
            category: item['category'].toString(),
            name: item['name'].toString(),
            price: item['price'].toString(),
            image: item['image'].toString()),
      );
    }
    return foodModel;
  }
}
