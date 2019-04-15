
import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:your_doctor/ui/home/log_in/login_page.dart';
import 'package:your_doctor/ui/home/log_in/register_page.dart';
import 'package:your_doctor/util/constant.dart';

class HomeCreatingCount extends StatefulWidget {
  @override
  _CreatingCountState createState() => new _CreatingCountState();
}

class _CreatingCountState extends State<HomeCreatingCount>
    with TickerProviderStateMixin {
  final List<Tab> tabs = <Tab>[
    new Tab(text: "Log In"),
    new Tab(text: "Sign Up")
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: tabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: ThemeColors.CanvasColor,
        bottom: new TabBar(
          isScrollable: true,
          unselectedLabelColor: Colors.grey,
          labelColor: ThemeColors.PrimaryColor,
          labelStyle: new TextStyle(
              fontSize: 32.0,
              color: Colors.indigo[50],
              fontFamily: "Roboto",
              fontWeight: FontWeight.w900),
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: new BubbleTabIndicator(
            indicatorHeight: 44.0,
            indicatorColor: Colors.white,
            tabBarIndicatorSize: TabBarIndicatorSize.tab,
          ),
          tabs: tabs,
          controller: _tabController,
        ),
      ),
      body: new TabBarView(
          controller: _tabController,
          children: <Widget>[LoginPage(), RegisterPage()]),
    );
  }
} //
