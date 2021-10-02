import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Your order',
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }
}
