import 'package:flutter/material.dart';
import 'package:topnews/screens/news_detail_screen.dart';
import 'package:topnews/utils/database_helpers.dart';

// This widget create a news item for the news overview screen

class NewsItem extends StatelessWidget {
  final String title;
  final String url;
  final String description;
  final dynamic multimedia;
  // final String
  final String id;

  final db = new DatabaseHelper();
  NewsItem({this.title, this.url, this.multimedia, this.description, this.id});

  _viewNews(BuildContext context) async {
    // var savedPost =  await db.savePost(new Post(id, title, multimedia, url,'New York Times',new DateTime.now() ));
    // print('Post saved: ${new DateTime.now()}');
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => TopNewsDetailScreen(
                title: title,
                multimedia: multimedia,
                url: url,
                description: description,
                id: id)));
    Navigator.of(context).pushNamed(TopNewsDetailScreen.routeName,
        arguments: {"title": title, "multimedia:": multimedia});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          _viewNews(context);
        },
        child: Card(
            elevation: 5,
            margin: EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Column(children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: multimedia != null
                    ? Image.network(multimedia[0]['url'],
                        height: 250, width: double.infinity, fit: BoxFit.cover)
                    : Text(''),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
                child:
                    Text(title, style: Theme.of(context).textTheme.headline6),
              )
            ])));
  }
}
