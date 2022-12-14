import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io' show Platform, exit;

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              child: Image.asset("assets/icon.png"),
          ),
          ListTile(
            leading: const Icon(Icons.rate_review,color: Colors.pink),
            title: const Text('Support us',style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () async {
              Navigator.pop(context);
              final InAppReview inAppReview = InAppReview.instance;
              if (await inAppReview.isAvailable()) {
                inAppReview.requestReview();
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.share,color: Colors.teal),
            title: const Text('Share',style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () {
              Navigator.pop(context);
              if (Platform.isAndroid) {
                Share.share("Hey check out my Application at: https://play.google.com/store/apps/details?id=com.salam.never_have_i_ever");
              } else if (Platform.isIOS) {}
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app,color: Colors.red,),
            title: const Text('Exit',style: TextStyle(fontWeight: FontWeight.bold)),
            onTap: () => exit(0),
          ),
        ],
      ),
    );
  }
}
