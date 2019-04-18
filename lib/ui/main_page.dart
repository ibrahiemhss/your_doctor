import 'package:flutter/material.dart';
import 'package:your_doctor/data/user/user_data.dart';
import 'package:your_doctor/ui/customviews/gradientContainer.dart';
import 'package:your_doctor/ui/home/home_page/home_screen_page.dart';
import 'package:your_doctor/ui/home/meetings.dart';
import 'package:your_doctor/ui/home/profile/profile_page.dart';
import 'package:your_doctor/ui/home/search_page/search_page.dart';
import 'package:your_doctor/ui/main_app_bar.dart';
import 'package:your_doctor/util/app_shared_preferences.dart';
import 'package:your_doctor/util/constant.dart';

class MainPage extends StatefulWidget {
  int pagId = 0;
  bool fromBack = false;
  bool isLogedIn;

  MainPage(
      {@required this.isLogedIn,
      @required this.fromBack,
      @required this.pagId});

  @override
  _ScreenOneState createState() => new _ScreenOneState(
      isLogedIn: isLogedIn, fromBack: fromBack, pagId: pagId);
}

const List<String> tabNames = const <String>[
  'Home',
  'Search',
  'Cart',
  'Profile',
  'More'
];

abstract class MainScreenCallBack {
  void onLogInSuccessfully(bool logedIn);

  void onError(String message);
}

class _ScreenOneState extends State<MainPage> implements MainScreenCallBack {
  int pagId;
  bool isLogedIn;
  bool fromBack = false;
  String name;
  String email;
  String phone;

  Future<User> user = AppSharedPreferences.getUserProfile();
  static String userName;
  static String userEmail;
  static String userPhone;

  _ScreenOneState(
      {@required this.isLogedIn,
      @required this.pagId,
      @required this.fromBack});

// static bool isLogedIn=false;

  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreenPage(),
    SearchPage(),
    Meetings(),
    ProfilePage(),
    Grad(
      child: Center(
          child: Text(
        "hellooyu World",
        style: TextStyle(fontSize: 24, color: Color(0xeeffffff)),
      )),
    ),
  ];

  Future<bool> _getLogInStatus() async {
    if (await AppSharedPreferences.isUserLoggedIn() == true) {
      setState(() {
        isLogedIn = true;
      });
    } else {
      setState(() {
        isLogedIn = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    if (fromBack) {
      _currentIndex = pagId;
      userName = name;
      userEmail = email;
      userPhone = phone;
    }
    _getLogInStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          Container(
              child: MainBarWidget(
            onPressedBell: () {},
            onPressedChat: () {},
            isCreatingAcount: isLogedIn,
          ))
        ],
      ),

      // setting canvasColor to transparent
      backgroundColor: ThemeColors.PrimaryColor_Dark,

      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 24,
        type: BottomNavigationBarType.shifting,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            activeIcon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            title: Text(
              'الرئيسية',
              style: TextStyle(color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            title: Text(
              'بحث',
              style: TextStyle(color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.event_note,
              color: Colors.white,
            ),
            icon: Icon(
              Icons.event_note,
              color: Colors.white,
            ),
            title: Text(
              'مواعيدي',
              style: TextStyle(color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            title: Text(
              'حسابي',
              style: TextStyle(color: Colors.white),
            ),
          ),
          BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              title: Text(
                'المزيد',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;

      if (index == 4) {
        setState(() {
          // _showModalSheet();
        });
      }
    });
  }

  @override
  void onLogInSuccessfully(bool logedIn) {
    // TODO: implement onLogInSuccessfully
    setState(() {
      isLogedIn = logedIn;
    });
  }

  @override
  void onError(String message) {
    // TODO: implement onError
    print(message);
  }
}
