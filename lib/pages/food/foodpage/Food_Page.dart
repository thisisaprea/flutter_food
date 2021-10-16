import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_food/models/food_item.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_food/pages/food/foodpage/foodlist_page.dart';
import 'package:flutter_food/pages/food/foodpage/OrderPage.dart';

class foodpage extends StatefulWidget {
  const foodpage({Key? key}) : super(key: key);
  static const routeName = '/food';

  @override
  _foodpageState createState() => _foodpageState();
}

class _foodpageState extends State<foodpage> {
  int _selectedBottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: _selectedBottomNavIndex == 0 ? FoodListPage() : OrderPage()),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book),
              label: 'Menu'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Your Order'
          ),
        ],
        currentIndex: _selectedBottomNavIndex,
        onTap: (index) {
          setState(() {
            _selectedBottomNavIndex = index;
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _test,
        child: Icon(Icons.add),
      ),
    );
  }
  Future<void> _test() async {
    var url = Uri.parse('https://cpsu-test-api.herokuapp.com/foods');
    var response = await http.post(url, body: {
      'pin': '123456'
    });

    if(response.statusCode == 200){
      Map<String, dynamic> jsonBody = json.decode(response.body);
      String status = jsonBody['status'];
      String? message = jsonBody['message'];
      List<dynamic> data = jsonBody['data'];
      print('STATUS: $status');
      print('MESSAGE: $message');
      print('data: $data');
      /*var foodList = data.map((element) => FoodItem(
          id: element['id'],
          name: element['name'],
          price: element['price'],
          image: element['image'])
      ).toList();*/
    }
  }
}
