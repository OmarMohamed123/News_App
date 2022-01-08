import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/newsModel.dart';
import 'package:news_app/view/widgets/card.dart';
import 'package:news_app/control/api.dart';
import 'package:news_app/view/widgets/mainScreen.dart';

import '../constants.dart';

class General extends StatefulWidget {
  const General({Key? key}) : super(key: key);

  @override
  _GeneralState createState() => _GeneralState();
}

class _GeneralState extends State<General> {
  Future<List<NewsModel>>? x;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Main("Home", "");
  }
}
