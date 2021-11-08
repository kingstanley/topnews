import 'package:flutter/material.dart';
import 'package:topnews/widgets/main_drawer.dart';

class TopNewsFavoriteScreen extends StatelessWidget {
  static final routeName = 'favorite-categories';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Categories'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text(
            'Favorite category screen to display list of categories marked as favorite'),
      ),
    );
  }
}
