import 'package:flutter/material.dart';
import 'package:news_app/view/widgets/mainScreen.dart';
class Technology extends StatelessWidget {
  const Technology({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Main("Technology","&category=technology");
  }
}
