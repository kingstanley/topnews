// import 'dart:convert';
//import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';
import 'package:topnews/widgets/main_drawer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web_browser/web_browser.dart';

// import 'package:admob_flutter/admob_flutter.dart';
// import 'package:facebook_audience_network/facebook_audience_network.dart';

class TopNewsDetailScreen extends StatefulWidget {
  final String title;
  final dynamic multimedia;
  final String url;
  final String description;

  TopNewsDetailScreen(
      {this.title, this.multimedia, this.url, this.description, String id});
  static final routeName = 'top-news-detail';

  @override
  _TopNewsDetailScreenState createState() => _TopNewsDetailScreenState();
}

class _TopNewsDetailScreenState extends State<TopNewsDetailScreen> {
  dynamic post;

  _newsDetail() async {
    // print(widget.url);
    // http.Response response = await http.get(widget.url);
    // Map decode = json.decode(response.body);
    // var results = decode['results'];
    // print("details of the news: $decode");
    // setState(() {
    //   post = results;
    // });

    // const url = widget.url;
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => WebBrowser(
                initialUrl: widget.url,
              )),
    );

    // if (await canLaunch(widget.url)) {
    //   print("url to luanch: " + widget.url);
    //   await launch(widget.url, forceWebView: true);
    // } else {
    //   throw 'Could not launch ${widget.url}';
    // }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // FacebookInterstitialAd.loadInterstitialAd(
    //   placementId: "544368322893236",
    //   listener: (result, value) {
    //     if (result == InterstitialAdResult.LOADED)
    //       FacebookInterstitialAd.showInterstitialAd(delay: 5000);
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('News Detail'),
        ),
        drawer: MainDrawer(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Column(children: <Widget>[
              Text(widget.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Divider(),
              // Add text widget here to display formated date
              Image.network(widget.multimedia[0]['url'],
                  height: 250, width: double.infinity, fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
                child: Text(
                  widget.description,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              TextButton(
                  onPressed: () => _newsDetail(),
                  child: Text("Read More >",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Theme.of(context).accentColor,
                      )))
            ])),
          ),
        ));
  }
}
