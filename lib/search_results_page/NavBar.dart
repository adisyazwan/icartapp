import 'package:flutter/material.dart';
import 'page_one.dart';
import 'page_two.dart';
import 'page_three.dart';
import 'page_four.dart';
import 'page_five.dart';
import 'page_six.dart';
import 'page_seven.dart';
import 'page_eight.dart';
import 'page_nine.dart';
import 'page_ten.dart';
import 'page_eleven.dart';
import 'page_twelve.dart';
import 'page_thirteen.dart';
import 'page_fourteen.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.only(top: 24.0),
        children: [
          ListTile(
            title: Text('Beverages'),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PageThree()),
              );
            },
          ),
          ListTile(
            title: Text('Books and Stationary'),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PageFour()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Canned Food'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PageFive()),
              );
            },
          ),
          ListTile(
            title: Text('Cleaning Supplies'),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PageSix()),
              );
            },
          ),
          ListTile(
            title: Text('Dairy Products'),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PageSeven()),
              );
            },
          ),
          ListTile(
            title: Text('Dry/Baking Stuff'),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PageTwo()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Fresh Produce'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PageThirteen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Frozen Food'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PageEight()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Herbs'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PageThirteen()),
              );
            },
          ),
          ListTile(
            title: Text('Hygiene and Personal'),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PageNine()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Meat and Fish'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PageTen()),
              );
            },
          ),
          ListTile(
            title: Text('News and Magazines'),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PageEleven()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Pharmacy'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PageTwelve()),
              );
            },
          ),
          ListTile(
            title: Text('Salad and Bakery'),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PageOne()),
              );
            },
          ),
          ListTile(
            title: Text('Sweets and Snacks'),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PageFourteen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
