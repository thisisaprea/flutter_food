import 'package:flutter/material.dart';
import 'package:flutter_food/models/food_item.dart';

class FoodDetails extends StatelessWidget {
  const FoodDetails({Key? key}) : super(key: key);
  static const routeName = '/foodDetails';

  @override
  Widget build(BuildContext context) {
    var food = ModalRoute.of(context)!.settings.arguments as FoodItem;
    return Scaffold(
      appBar: AppBar(
        title: Text(food.name),
        backgroundColor: Colors.indigo,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Image.asset(
              'assets/images/${food.image}',
              width: 500,
              height: 500,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("ชื่อเมนู : ${food.name} \nราคา : ${food.price} บาท",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                )),
          ),
        ],
      ),
    );
  }
}
