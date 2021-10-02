import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static const routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(200.0),
                child: Container(
                  width: 300.0,
                  height: 300.0,
                  child: Image.asset('assets/images/YK.jpg'),
                ),
              ),
            ],
          ),
          Text(
            'Chanida Srithep',
            style: Theme
                .of(context)
                .textTheme
                .headline6,
          ),
          Text(
            'srithep_c@silpakorn.edu',
            style: Theme
                .of(context)
                .textTheme
                .bodyText1,
          ),
        ],
      ),
    );
  }
}
