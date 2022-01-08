import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:country_code_picker/country_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'AppPreference.dart';
import 'constants.dart';
import 'view/home_screen.dart';

void main() async {
  Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  AppModel appModel = new AppModel();

  @override
  void initState() {
    super.initState();
    _initAppTheme();
  }
  void _initAppTheme() async {
    appModel.darkTheme = await appModel.appPreference.getTheme();
  }
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<AppModel>.value(
      value: appModel,
      child: Consumer<AppModel>(
          builder: (context, value, child) {
            return MaterialApp(
                title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: appModel.darkTheme ? buildDarkTheme() : buildLightTheme(),
            home: AnimatedSplashScreen(
                   backgroundColor:Color(0xFFB1D0E0),
                 splash: Image.asset(
                     'assets/images/world-news.png',
                     // width: 600,
                     // height: 350,
                     fit:BoxFit.fill
                 ),
                 nextScreen: MyHomePage(title: 'Flutter Demo Home Page'),
                 splashTransition: SplashTransition.rotationTransition,

              //pageTransitionType: PageTransitionType.scale,
            ));
          }
      ),
    );
  }
}



