import 'package:topnews/widgets/favorite_item.dart';

import '../screens/categories_screen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget buildListTile(String title, IconData icon, Function tabHandler) {
      return ListTile(
          onTap: tabHandler,
          leading: Icon(icon),
          title: Text(title,
              style: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 24,
                  fontWeight: FontWeight.w700)));
    }

    return Drawer(
      child: Column(
        children: <Widget>[
          // Drawer title
          Container(
            height: 120,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Image.asset(
              'ic_launcher-web.png',
              // fit: BoxFit.cover,
            ),
            // Column(
            //   children: [
            // Text(
            //   "Top News",
            //   style: TextStyle(
            //       fontWeight: FontWeight.w900,
            //       fontSize: 30,
            //       color: Theme.of(context).primaryColor),
            // ),
            //     Image.asset(
            //       '/mipmap-xxxhdpi/ic_launcher.png',
            //       fit: BoxFit.fitHeight,
            //     ),
            //   ],
            // ),
          ),
          SizedBox(
            height: 20,
          ),
          buildListTile("All News", Icons.note, () {
            Navigator.of(context).pushReplacementNamed("/");
          }),
          buildListTile("News Category", Icons.category, () {
            Navigator.of(context)
                .pushReplacementNamed(TopNewsCategoryScreen.routeName);
          }),
          buildListTile("Favorite Categories", Icons.favorite_border, () {
            Navigator.of(context)
                .pushReplacementNamed(TopNewsFavoriteScreen.routeName);
          }),
        ],
      ),
    );
  }
}
