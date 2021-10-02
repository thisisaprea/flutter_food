import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FoodList extends StatelessWidget {
  const FoodList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Food Menu',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
