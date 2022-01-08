import 'package:flutter/cupertino.dart';
import 'package:news_app/view/widgets/mainScreen.dart';

class Sports extends StatefulWidget {
  const Sports({Key? key}) : super(key: key);

  @override
  _SportsState createState() => _SportsState();
}

class _SportsState extends State<Sports> {
  @override
  Widget build(BuildContext context) {
    return Main("Sports","&category=sports");
  }
}
