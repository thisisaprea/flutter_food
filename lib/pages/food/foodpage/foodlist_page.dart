import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food/models/food_item.dart';
import 'package:flutter_food/pages/food/foodpage/food_details.dart';
class FoodListPage extends StatefulWidget {
  const FoodListPage({Key? key}) : super(key: key);
  static const routeName = '/foodlist';
  @override
  _FoodListPageState createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  final List<FoodItem>items = [
    FoodItem(
      id: 1,
      name: 'ต๊อกบกกี',
      price: 50,
      image: 'tokbokki.jpg',
    ),
    FoodItem(
      id: 2,
      name: 'ผัดไท',
      price: 30,
      image: 'pad_thai.jpg',
    ),FoodItem(
      id: 3,
      name: 'ข้าวมันไก่',
      price: 40,
      image: 'kao_mun_kai.jpg',
    ),FoodItem(
      id: 4,
      name: 'ส้มตำไก่ย่าง',
      price: 100,
      image: 'som_tum_kai_yang.jpg',
    ),FoodItem(
      id: 5,
      name: 'คิมบับ',
      price: 60,
      image: 'kimpub.jpg',
    ),FoodItem(
      id: 6,
      name: ' ชุดซูชิรวม',
      price: 300,
      image: 'sushi.jpg',
    ),FoodItem(
      id: 7,
      name: 'ชุดจิ้มจุ่มรวม',
      price: 200,
      image: 'jimjum.jpg',
    ),FoodItem(
      id: 8,
      name: 'ผัดซีอิ้ว',
      price: 40,
      image: 'pad_sie_eew.jpg',
    ),FoodItem(
      id: 9,
      name: 'ไก่ทอด',
      price: 150,
      image: 'kai_tod.jpg',
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          FoodItem item = items[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                Navigator.pushNamed(
                  context,

                  FoodDetails.routeName,
                  arguments: item,
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/${item.image}',
                      width: 60.0,
                      height: 60.0,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      '${item.name} \n ${item.price} บาท',
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
