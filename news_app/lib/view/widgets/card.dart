import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
import '../../constants.dart';
import 'package:news_app/control/functions.dart';
class NewsCard extends StatefulWidget {
  final String title;
  final String urlToImage;
  final String url;

  const NewsCard({Key? key, required this.title, required this.urlToImage, required this.url})
      : super(key: key);

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2.5,

      child: InkWell(
        onTap: ()async{
         // launch("${widget.title}");
          Functions.launchLink("${widget.url}");
        //  print("xxxxxxxxxxxxxxx${widget.title}");
        },
        child: Card(

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          elevation: 10,
          color: Color(0xFF406882),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 3.7,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25)),
                    image: DecorationImage(
                    fit: BoxFit.cover,
                         image:(widget.urlToImage=="null")? NetworkImage("https://www.theiasilver.com/index.php/images/products/162134606160a3c70d603fd.jpg"):NetworkImage("${widget.urlToImage}")
                    )),
              ),

              Container(

                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Center(child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("${widget.title}",maxLines: 1,textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                )),
              ),
              Container(
                  child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Functions.shareLink("${widget.url}");
                      },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.copy,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // do something
                      Functions.copyLink("${widget.url}");
                    },
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
