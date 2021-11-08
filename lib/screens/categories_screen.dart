import 'package:flutter/material.dart'; 
import 'package:topnews/widgets/main_drawer.dart';

class TopNewsCategoryScreen extends StatelessWidget {
static final routeName = 'top-news-category';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(title:  Text("News Categories"),),
          drawer: MainDrawer(),
      body: Center(child: Text("Top News Category Screen"),),
    );
  }
}