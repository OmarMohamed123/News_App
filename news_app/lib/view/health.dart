import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/control/api.dart';
import 'package:news_app/view/widgets/card.dart';
import 'package:news_app/view/widgets/mainScreen.dart';
class Health extends StatelessWidget {
   Health({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Main("Health","&category=health");
  }
}
