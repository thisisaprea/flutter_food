import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_food/pages/food/foodpage/foodlist/foodlist_page.dart';
import 'package:flutter_food/pages/food/foodpage/foodorder/OrderPage.dart';

class foodpage extends StatefulWidget {
  const foodpage({Key? key}) : super(key: key);
  static const routeName = '/food';
  @override
  _foodpageState createState() => _foodpageState();
}

class _foodpageState extends State<foodpage> {
  var _seletedBottomNavIndex = 0;
  List<Widget> _pageWidget = <Widget>[
    FoodList(),
    OrderPage(),
  ];
  List<BottomNavigationBarItem> _barselected = [
    BottomNavigationBarItem(
      icon: Icon(Icons.menu_book),
      label: 'Menu',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      label: 'Your Order',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageWidget.elementAt(_seletedBottomNavIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: _barselected,
        currentIndex: _seletedBottomNavIndex,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.indigo.shade200,
        onTap: (index){
          setState(() {
            _seletedBottomNavIndex = index;
          });
        },
      ),
    );
  }
}
