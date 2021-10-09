import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_food/pages/food/foodpage/Food_Page.dart';
import 'package:flutter_food/pages/profile/Profile_Page.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _subPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FOOD'),
        backgroundColor: Colors.indigo,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.topRight,
                  colors: [
                    Colors.indigo.shade200,
                    Colors.deepOrangeAccent.shade200,
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40.0),
                    child: Container(
                      width: 80.0,
                      height: 80.0,
                      child: Image.asset('assets/images/YK.jpg'),
                    ),
                  ),
                  Text(
                    'Chanida Srithep',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Text(
                    'srithep_c@silpakorn.edu',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
            ListTile(
              title: _buildDrawerItem(
                  Icon(
                    Icons.fastfood,
                    color: _subPageIndex == 0
                        ? Colors.deepOrangeAccent
                        : Colors.deepOrangeAccent.shade100,
                  ),
                  'Food'),
              onTap: () => _showSubPage(0),
            ),
            ListTile(
              title: _buildDrawerItem(
                  Icon(
                    Icons.person,
                    color: _subPageIndex == 1
                        ? Colors.deepOrangeAccent
                        : Colors.deepOrangeAccent.shade100,
                  ),
                  'Profile'),
              onTap: () => _showSubPage(1),
            ),
          ],
        ),
      ),
      body: Container(
        child: _buildSubPage(),
      ),
    );
  }

  _showSubPage(int index) {
    setState(() {
      _subPageIndex = index;
    });
    Navigator.of(context).pop();
  }


  _buildSubPage() {
    switch (_subPageIndex) {
      case 0: // home page
        return foodpage();
      case 1:
        return ProfilePage();
      default:
        return SizedBox.shrink();
    }
  }

  Row _buildDrawerItem(Widget icon, String title) {
    return Row(
      children: [
        icon,
        SizedBox(width: 8.0),
        Text(title),
      ],
    );
  }
}
