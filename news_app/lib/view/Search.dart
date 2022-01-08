import 'package:flutter/material.dart';
import 'package:news_app/control/api.dart';
import 'package:news_app/view/widgets/card.dart';

import '../constants.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String searchValue="q=bake";
  // @override
  // void setState(VoidCallback fn) {
  //   // TODO: implement setState
  //   super.setState(fn);
  // }
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: new Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: dark2,
                ),
                child: Text(
                  'Choose Your Country',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              ListTile(
                title: const Text('Egypt'),
                onTap: () {},
              ),
            ],
          ),
        ),
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.account_circle,
              color: Colors.black,
              size: 40,
            ),
            onPressed: () => _scaffoldKey.currentState!.openDrawer(),
          ),
          backgroundColor: light,
          title: Center(
            child: Text(
              "Search",
              textAlign: TextAlign.center,
              style: new TextStyle(fontSize: fontbigger, color: Colors.black),
            ),
          ),
        ),
        body: Column(

          children: [
            Container(
              padding: new EdgeInsets.all(20.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(labelText: "Ex: Trump"),
              ),
            ),
            MaterialButton(
              onPressed: (){
                setState(() {
                  searchValue="q=${searchController.text}";
                  print(searchValue);
                  super.initState();
                });
},
              child: Text("Search"),
              color: dark2,
            ),
            Expanded(
              child: FutureBuilder(
                future: Api.searchNews("$searchValue"),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (!snapshot.hasData)
                    return Center(
                        child: CircularProgressIndicator(
                      color: dark2,
                    )
                    ); //CIRCULAR INDICATOR
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
              ),
            ),
          ],
        ));
  }
}
