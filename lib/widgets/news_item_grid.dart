import 'package:flutter/material.dart';
import 'package:topnews/screens/news_detail_screen.dart';
import 'package:topnews/utils/database_helpers.dart';

// This widget create a news item for the news overview screen

class NewsItemGrid extends StatelessWidget {
  final String title;
  final String url;
  final String description;
  final dynamic multimedia;
  // final String
  final String id;

  final db = new DatabaseHelper();
  NewsItemGrid(
      {this.title, this.url, this.multimedia, this.description, this.id});

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
        onTap: () => {_viewNews(context)},
        child: Card(
          elevation: 5,
          margin: EdgeInsets.all(10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: GridTile(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: multimedia != null
                    ? Image.network(multimedia[0]['url'],
                        height: 250, width: double.infinity, fit: BoxFit.cover)
                    : Text(''),
              ),
              footer: GridTileBar(
                backgroundColor: Colors.black45,
                subtitle: title.length <= 70
                    ? Text(title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                Theme.of(context).textTheme.headline6.fontSize))
                    : Text(title,
                        style: TextStyle(
                            color: Colors.white,
                            backgroundColor: Theme.of(context)
                                .textTheme
                                .headline6
                                .backgroundColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 13.0)),
              )),
        ));
  }
}
