import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
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
    );
  }
}
