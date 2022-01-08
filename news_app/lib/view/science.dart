import 'package:flutter/material.dart';
import 'package:news_app/control/api.dart';
import 'package:news_app/view/widgets/card.dart';
import 'package:news_app/view/widgets/mainScreen.dart';

import '../constants.dart';
class Science extends StatefulWidget {
  const Science({Key? key}) : super(key: key);

  @override
  _ScienceState createState() => _ScienceState();
}

class _ScienceState extends State<Science> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
_ScienceState(){

}
  @override
  Widget build(BuildContext context) {
    return Main("Science","&category=science");
  }
}
