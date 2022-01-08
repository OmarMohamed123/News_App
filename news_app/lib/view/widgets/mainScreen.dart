import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:news_app/control/api.dart';
import 'package:provider/provider.dart';
import '../../AppPreference.dart';
import '../../constants.dart';
import 'appBar.dart';
import 'card.dart';

class Main extends StatefulWidget {
  String pageTitle;
  String newsType;

  Main(this.pageTitle, this.newsType);

  @override
  _MainState createState() => _MainState();
}




class _MainState extends State<Main> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    final appModel = Provider.of<AppModel>(context);
    return Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                ),
                child: Text(
                  'Customizations',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              CountryCodePicker(
                // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                initialSelection: 'EG',
                favorite: ['FR'],
                // optional. Shows only country name and flag
                // showCountryOnly: false,
                // // optional. Shows only country name and flag when popup is closed.
                showOnlyCountryWhenClosed: false,
              ),
            ],
          ),
        ),

        appBar: AppBar(

          actions: [

            IconButton(
              onPressed: () {
                setState(() {
                  if (isPressed == true) {
                    isPressed = false;
                   // AdaptiveTheme.of(context).setDark();
                    appModel.darkTheme = !appModel.darkTheme;
                  } else {
                    isPressed = true;
                 //   AdaptiveTheme.of(context).setLight();
                    appModel.darkTheme = !appModel.darkTheme;
                  }
                });
              },
              icon: (isPressed)
                  ? Icon(
                      Icons.dark_mode,
                      color: Colors.black,
                      size: 40,
                    )
                  : Icon(
                      Icons.dark_mode_outlined,
                      color: Colors.black,
                      size: 40,
                    ),
            )
          ],
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.account_circle,
              color: Colors.black,
              size: 40,
            ),
            onPressed: () => _scaffoldKey.currentState!.openDrawer(),
          ),
          backgroundColor: light,
          title: Text(
            "${widget.pageTitle}",
            textAlign: TextAlign.center,
            style: new TextStyle(fontSize: fontbigger, color: Colors.black),
          ),
        ),
        body: FutureBuilder(
          future: Api.fetchNews("${widget.newsType}"),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (!snapshot.hasData)
              return Center(
                  child: CircularProgressIndicator(

              )); //CIRCULAR INDICATOR
            else
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(6),
                    child: SafeArea(
                      child: Center(
                        child: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: [
                            Container(
                              child: NewsCard(
                                title: "${snapshot.data?[index].title}",
                                urlToImage:
                                    "${snapshot.data?[index].urlToImage}",
                                url: "${snapshot.data?[index].url}",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
          },
        ),);
  }
}
