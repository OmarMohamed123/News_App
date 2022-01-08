import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_app/constants.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class Functions {
  static shareLink(String Link) {
    Share.share('This Link is Shared from $appName app: $Link');
  }

  static launchLink(String Link) async {
    if (!await launch("$Link")) throw 'Could not launch Link';
  }

  static copyLink(String Link) async {
    FlutterClipboard.copy("$Link");
    Fluttertoast.showToast(
        msg: "link copied successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: dark2,
        textColor: Colors.white,
        fontSize: 16.0
    );

  }

}
