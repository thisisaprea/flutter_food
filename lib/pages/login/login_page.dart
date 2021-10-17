//07610411 :) ;)
import 'package:flutter/material.dart';
import 'package:flutter_food/services/api.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/LoginPage';
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const PIN_LENGTH = 6;
  var _input = '';
  var _isLoading = false;

  void _showMaterialDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "ERROR!",
            style: TextStyle(color: Colors.black),
          ),
          content: Text("Invalid PIN. Please try again!"),
          actions: [
            // ปุ่ม OK ใน dialog
            TextButton(
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Colors.deepPurple,
                ),
              ),
              onPressed: () {
                // ปิด dialog
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.pink.shade200,
              Colors.indigo.shade500,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/foodapp.png',
                      width: 130.0,
                    ),
                    Text(
                      'LOGIN',
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline1,
                    ),
                    Text(
                      'Enter PIN to login',
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          for(int i = 0; i < _input.length; i++)
                            Icon(Icons.circle, size: 20,
                              color: Colors.deepPurple.shade500,),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    /*for (var row = 0; row < 3; row++)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (var col = 1; col <= 3; col++)
                            LoginButton(number: row * 3 + col),
                        ],
                      ),*/

                    [1, 2, 3],
                    [4, 5, 6],
                    [7, 8, 9],
                    [-2, 0, -1],
                  ].map((row) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: row.map((item) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: LoginButton(
                            number: item,
                            onClick: _handleClickButton,
                          ),
                        );
                      }).toList(),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  _handleClickButton(int num) async {
    print('You pressed $num');

    if (num == -1) {
      if (_input.length > 0) {
        setState(() {
          _input = _input.substring(0, _input.length - 1);
        });
      }
    } else {
      setState(() {
        _input = '$_input$num';
      });
    }

    if (_input.length == PIN_LENGTH) {
      var isLogin = await _login(_input);

      if (isLogin == null) return;

      if (isLogin) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        setState(() {
          _input = '';
        });
        _showMaterialDialog();
      }
    }
  }
  Future<bool?> _login(String pin) async {
    try {
      setState(() {
        _isLoading = true;
      });
      var isLogin = (await Api().submit('login', {'pin': pin})) as bool;
      print('LOGIN: $isLogin');
      return isLogin;
    } catch (e) {
      print(e);
      _showMaterialDialog();
      return null;
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}


class LoginButton extends StatelessWidget {
  final int number;
  final Function(int) onClick;

  const LoginButton({
    required this.number,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: CircleBorder(),
      onTap: number == -2
          ? null
          : () {
              onClick(number);
            },
      child: Container(
        width: 80.0,
        height: 80.0,
        decoration: number == -2
            ? null
            : BoxDecoration(
                color: Colors.black12,
                shape: BoxShape.circle,
                //border: Border.all(width: 2.0),
              ),
        child: Center(
          child: number >= 0
              ? Text(
                  '$number',
                  style: Theme.of(context).textTheme.headline6,
                )
              : (number == -1
                  ? Icon(
                      Icons.backspace_outlined,
                      size: 30.0,
                    )
                  : SizedBox.shrink()),
        ),
      ),
    );
  }
}
