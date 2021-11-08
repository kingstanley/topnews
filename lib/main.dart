// import 'package:admob_flutter/admob_flutter.dart';
// import 'package:facebook_audience_network/facebook_audience_network.dart';
//import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:topnews/screens/categories_screen.dart';
import 'package:flutter/material.dart';
import 'package:topnews/screens/news_detail_screen.dart';
import 'package:topnews/widgets/favorite_item.dart';
import 'package:topnews/widgets/main_drawer.dart';
import 'package:web_browser/web_browser.dart';

import 'screens/categories_screen.dart';
import 'screens/new_overview_screen_large.dart';
import 'screens/new_overview_screen_medium.dart';
import 'screens/news_overview_screen.dart';
// import 'package:sqflite/sqflite.dart';

void main() {
  // Admob.initialize(getAppId());
  runApp(MyApp());
  // FacebookAudienceNetwork.init();
  // testingId: "6e004054-c9a1-4922-b541-c43d9803fc1a"
  // FacebookInterstitialAd.loadInterstitialAd(
  //   placementId: "187962842525702_259574638697855",
  //   listener: (result, value) {
  //     if (result == InterstitialAdResult.LOADED) {
  //       FacebookInterstitialAd.showInterstitialAd(delay: 5000);
  //       debugPrint('Add is now loaded');
  //     }
  //   },
  // );
}

String getAppId() {
  // admob setting
  // if (Platform.isIOS) {
  //   return 'pub-6122584295964126';
  // } else if (Platform.isAndroid) {
  return 'pub-6122584295964126';
  // }
  // return null;
}

enum ScreenSize { small, medium, large }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Top News',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => TopNewsOverViewScreen(),
        TopNewsFavoriteScreen.routeName: (_) => TopNewsFavoriteScreen(),
        TopNewsCategoryScreen.routeName: (_) => TopNewsCategoryScreen(),
        TopNewsDetailScreen.routeName: (_) => TopNewsDetailScreen()
      },

      ///
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }

  // Widget getHomePage(context) {
  //   Widget widget;
  //   switch (getScreenSize()) {
  //     case ScreenSize.small:
  //       widget = TopNewsOverViewScreen();
  //       break;
  //     case ScreenSize.medium:
  //       TopNewsOverViewScreenMedium();
  //       break;
  //     case ScreenSize.large:
  //       TopNewsOverViewScreenLarge();
  //       break;
  //     default:
  //   }
  //   return widget;
  // }

  final _breakPoint1 = 600.0;
  final _breakPoint2 = 800.0;
  ScreenSize getScreenSize(double width) {
    if (width <= _breakPoint1) {
      return ScreenSize.small;
    } else if (width >= _breakPoint1 && width <= _breakPoint2) {
      return ScreenSize.medium;
    } else {
      return ScreenSize.large;
    }
  }
}

//Facebook audence network id: 544368322893236