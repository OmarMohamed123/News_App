import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/NavBar_key.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/control/api.dart';
import 'package:news_app/view/business.dart';
import 'package:news_app/view/general.dart';
import 'package:news_app/view/health.dart';
import 'package:news_app/view/science.dart';
import 'package:news_app/view/sports.dart';
import 'package:news_app/view/Search.dart';
import 'package:news_app/view/technology.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

int selectedIndex=3;
var screens=[
  Business(),Health(),Technology(),General(),Search(),Science(),Sports()
];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
bottomNavigationBar: CurvedNavigationBar(
  index: selectedIndex,
  key: NavbarKey.getKey(),
  items: [
    Icon(Icons.business, size: MediaQuery.of(context).size.width/12),
    Icon(Icons.health_and_safety, size: MediaQuery.of(context).size.width/12),
    Icon(Icons.directions_car_rounded, size: MediaQuery.of(context).size.width/12),
    Icon(Icons.home, size: MediaQuery.of(context).size.width/12),
    Icon(Icons.search, size: MediaQuery.of(context).size.width/12),
    Icon(Icons.biotech, size: MediaQuery.of(context).size.width/12),
    Icon(Icons.sports_baseball, size: MediaQuery.of(context).size.width/12),

  ],
  onTap: (index) {
    setState(() {
      selectedIndex=index;
      body: screens[selectedIndex];
    });

},color: Color(0xFFB1D0E0),buttonBackgroundColor: Color(0xFFB1D0E0),backgroundColor: Color(0xFF406882),
),
      body: screens[selectedIndex],
    );
  }
}
