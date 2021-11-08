import 'dart:async';
import 'dart:convert';

//import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:topnews/widgets/main_drawer.dart';
import 'package:topnews/widgets/news_item.dart';
import 'package:topnews/widgets/news_item_grid.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:webfeed/domain/rss_feed.dart';

class TopNewsOverViewScreenMedium extends StatefulWidget {
  static final routeName = 'top-news-overview';
  static final apiKey = "9qapiOnguKdzg0jWODFBUMF1YLTAkHYV";

  @override
  _TopNewsOverViewScreenMediumState createState() =>
      _TopNewsOverViewScreenMediumState();
}

class _TopNewsOverViewScreenMediumState
    extends State<TopNewsOverViewScreenMedium> {
  List posts = [];

  bool _isInterstitialAdLoaded; //Make an instance

  // bool _isInterstitialAdLoaded = false;

  // Widget _currentAd = SizedBox(height: 0.0, width: 0.0);
  @override
  void initState() {
    // _currentAd = FacebookBannerAd(
    //   bannerSize: BannerSize.STANDARD,
    //   listener: (result, value) {
    //     print("BannerAd: $result-->$value");
    //   },
    // );
    _getPostsFromNYTimes();
    _getPostsFromVanguard();
    super.initState();
    FacebookAudienceNetwork.init(
        testingId: "b9f2908b-1a6b-4a5b-b862-ded7ce289e41");
    _loadInterstitialAd();
    _loadBannerAd();
  }

  _loadNativeAd() {
    FacebookNativeAd(
      placementId: "187962842525702_259574638697855",
      adType: NativeAdType.NATIVE_AD,
      height: 255,
      bannerAdSize: NativeBannerAdSize.HEIGHT_120,
    );
  }

  _loadInterstitialAd() {
    // AdSettings.addTestDevice("97e8a661-36a5-4a8a-aad6-d673c7625a97");
    FacebookInterstitialAd.loadInterstitialAd(
      placementId:
          "187962842525702_259574638697855", //"IMG_16_9_APP_INSTALL#2312433698835503_2650502525028617" YOUR_PLACEMENT_ID
      listener: (result, value) {
        print(">> FAN > Interstitial Ad: $result --> $value");
        if (result == InterstitialAdResult.LOADED)
          _isInterstitialAdLoaded = true;
        print('IsInterstitialAdLoaded: ' +
            this._isInterstitialAdLoaded.toString());
        FacebookInterstitialAd.showInterstitialAd(delay: 1);

        /// Once an Interstitial Ad has been dismissed and becomes invalidated,
        /// load a fresh Ad by calling this function.
        if (result == InterstitialAdResult.DISMISSED &&
            value["invalidated"] == true) {
          _isInterstitialAdLoaded = false;
        }
      },
    );
  }

  _loadBannerAd() {}
  void _getPostsFromVanguard() async {
    try {
      String url = "http://www.vanguardngr.com/feed/";
      http.Response response = await http.get(url);
      var data = RssFeed.parse(response.body);
      print('Data @1 $data');
    } catch (e) {
      print('Error occured executing getPostFromVanguard');
    }
  }

  void _getPostsFromNYTimes() async {
    try {
      // home, science, art, us, world, technology, business, finance
      String url =
          'https://api.nytimes.com/svc/topstories/v2/home.json?api-key=${TopNewsOverViewScreenMedium.apiKey}';
      http.Response response = await http.get(url);
      Map decode = json.decode(response.body);
      List results = decode['results'];
      setState(() {
        posts = results;

        // FacebookInterstitialAd.loadInterstitialAd(
        //   placementId: "187962842525702_259574638697855",
        //   listener: (result, value) {
        //     if (result == InterstitialAdResult.LOADED)
        //       FacebookInterstitialAd.showInterstitialAd(delay: 2000);
        //   },
        // );
        // this._loadInterstitialAd();
        Timer.periodic(
            Duration(
              minutes: 5,
            ),
            this._loadInterstitialAd());
      });
      this._loadNativeAd();
      // print(posts[0]);
// for (var postObject in results){
//   print(postObject['multimedia']);
      // if(postObject['multimedia']){
      //  print('The multimedia of the post: ' +postObject ['multimedia']['url']);
      // }
// }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Top News"),
        ),
        // drawer: MainDrawer(),
        body: SingleChildScrollView(
          child: Row(
            children: [
              Expanded(flex: 2, child: MainDrawer()),
              Expanded(
                  flex: 5,
                  child: Center(
                      child: GridView.count(
                          // Create a grid with 2 columns. If you change the scrollDirection to
                          // horizontal, this produces 2 rows.
                          crossAxisCount: 2,
                          // Generate 100 widgets that display their index in the List.
                          children: posts
                              .map((post) => NewsItemGrid(
                                  title: post['title'],
                                  url: post['url'],
                                  multimedia: post['multimedia'],
                                  description: post['abstract']))
                              .toList())))
            ],
          ),
        )
        // Flexible(
        //   child: Align(
        //     alignment: Alignment(0, 1),
        //     child: _currentAd,
        //   ),
        //   flex: 2,
        //   fit: FlexFit.tight,
        // )
        // ],
        // ),
        );
  }
}

// FacebookAudienceNetwork.init();
