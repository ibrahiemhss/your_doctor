import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:your_doctor/data/articles/articles_data.dart';
import 'package:your_doctor/module/articles_presenter.dart';
import 'package:your_doctor/util/constant.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

//import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:ui' as ui;

class HomeScreenPage extends StatefulWidget {
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomeScreenPage> implements ArticlesContract {
  List<String> selectedItems = [];
  List<Articles> _listArticles;
  ArticlesPresenter _articlesPresenter;

  FirebaseMessaging firebaseMessaging = new FirebaseMessaging();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      new FlutterLocalNotificationsPlugin();

  bool _isLoading;
  int quantity = 1;

  // final List<MaterialColor> _colors = [Colors.blue, Colors.indigo, Colors.red];

  _HomePageState() {
    _articlesPresenter = new ArticlesPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _articlesPresenter.loadArticles();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
      decoration: ThemeColors.Canvas,
      child: _isLoading
          ? new Center(
              child: new CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.indigo),
              ),
            )
          : _hometWidget(),
    ));
  }

  Widget _hometWidget() {
    double _width = MediaQuery.of(context).size.width;

    print(_width.toString());
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,

      children: <Widget>[
//------------------------------------------------------------------------------
        _articlesListItems()
//------------------------------------------------------------------------------
      ],
    );
  }

//------------------------------------------------------------------------------
  Widget _articlesListItems() {
    double _container_item_height;
    double _container_item_width;

    double _latest_column_item_width;
    double _container_lis_height;

    double _latest_container_item_width;
    final mediaQueryData = MediaQuery.of(context);
    if (mediaQueryData.orientation == Orientation.landscape) {
      _container_item_height = MediaQuery.of(context).size.width / 8;
      _container_item_width = MediaQuery.of(context).size.height / 1.2;
      _container_lis_height = MediaQuery.of(context).size.width / 3;
    } else {
      _container_item_height = MediaQuery.of(context).size.height / 8;
      _container_item_width = MediaQuery.of(context).size.width / 1.2;
      _container_lis_height = MediaQuery.of(context).size.height / 4;
    }

    return new Flexible(
      child: Container(
        color: Colors.transparent,
        child: ListView.builder(
          itemCount: _listArticles.length,
          itemBuilder: (BuildContext context, int index) {
            final Articles lastArticlesVlaues = _listArticles[index];
            // final MaterialColor color = _colors[i % _colors.length];
            return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Scaffold(
                              appBar:
                                  appBar("Dr: ${lastArticlesVlaues.dr_name}"),
                              body: Container(
                                  decoration: ThemeColors.Canvas,
                                  child: ListView(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.network(
                                          lastArticlesVlaues.article_img,
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Container(
                                          child: Center(
                                            key: GlobalObjectKey(
                                                lastArticlesVlaues),
                                            child: Column(
                                              children: <Widget>[
                                                Text(
                                                  lastArticlesVlaues
                                                      .article_title,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 24),
                                                ),
                                                Text(
                                                  lastArticlesVlaues.article,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            )),
                  );
                },
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 16.0, left: 24.0, right: 24.0),
                  child: Container(
                    width: 300,
                    height: 250,
                    child: new Stack(
                      //alignment:new Alignment(x, y)
                      children: <Widget>[
                        new Positioned(
                          top: 0.0,
                          right: 0,
                          left: 0,
                          child: Container(
                            width: 300,
                            height: 180,
                            alignment: Alignment.center,
                            decoration: new BoxDecoration(
                              image: new DecorationImage(
                                  image: new NetworkImage(
                                      lastArticlesVlaues.article_img),
                                  fit: BoxFit.contain),
                              color: Colors.blue,
                            ),
                            child: new BackdropFilter(
                              filter: new ui.ImageFilter.blur(
                                sigmaX: 1.0,
                                sigmaY: 1.0,
                              ),
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: new Text(
                                  lastArticlesVlaues.article_title,
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500, // light
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        new Positioned(
                            bottom: 0.0,
                            right: 0,
                            left: 0,
                            child: Container(
                              decoration: new BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: const Radius.circular(15.0),
                                    bottomRight: const Radius.circular(15.0)),
                                color: Colors.blue,
                              ),
                              height: 90,
                              width: 300,
                              child: Stack(
                                children: <Widget>[
                                  new Positioned(
                                    bottom: 30.0,
                                    right: 100.0,
                                    child: Container(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Text(
                                            "Dr: ${lastArticlesVlaues.dr_name}",
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight:
                                                    FontWeight.w400, // light
                                                color: Colors.white),
                                          ),
                                          Text(
                                            "Specialty: ${lastArticlesVlaues.specialty}",
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight:
                                                    FontWeight.w300, // light
                                                color: Colors.white70),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  new Positioned(
                                    bottom: 0.0,
                                    left: 20.0,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        lastArticlesVlaues.date,
                                        textAlign: TextAlign.end,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight:
                                                FontWeight.w300, // light
                                            color: Colors.white70),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        new Positioned(
                          bottom: 60.0,
                          right: 50.0,
                          child: CircleAvatar(
                              backgroundImage: new NetworkImage(
                                  lastArticlesVlaues.doctor_img)),
                        ),
                      ],
                    ),
                  ),
                ));
          },
        ),
      ),
    );
  }

//------------------------------------------------------------------------------

  Widget appBar(String title) {
    IconData _backIcon() {
      switch (Theme.of(context).platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          return Icons.arrow_back;
        case TargetPlatform.iOS:
          return Icons.arrow_back_ios;
      }
      assert(false);
      return null;
    }

    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: Icon(_backIcon()),
        color: Colors.white,
        alignment: Alignment.centerLeft,
        tooltip: 'Back',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Text(title),
      backgroundColor: ThemeColors.CanvasColor,
    );
  }

//==============================================================================
  @override
  void onLoadArticlesCompleted(List<Articles> items) {
    // TODO: implement onLoadArticlesCompleted

    setState(() {
      _listArticles = items;
      _isLoading = false;
    });
  }

  @override
  void onLoadArticlesError() {
    // TODO: implement onLoadArticlesError
  }
}
