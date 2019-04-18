import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:your_doctor/data/user/user_data.dart';
import 'package:your_doctor/ui/home/home_create_count.dart';
import 'package:your_doctor/ui/home/log_in/register_page.dart';
import 'package:your_doctor/ui/home/profile/more_options_widget.dart';
import 'package:your_doctor/ui/home/profile/order_details_widget.dart';
import 'package:your_doctor/util/app_shared_preferences.dart';
import 'package:your_doctor/util/constant.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => new _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  String name;
  String email;
  String phone;
  String imgUrl;

  bool isLoaded = true;

  bool isLogedIn = false;

  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  Future<Null> _checkIsLogin() async {
    User sharedUserValue = await AppSharedPreferences.getUserProfile();
    if (sharedUserValue != null) {
      if (await AppSharedPreferences.isUserLoggedIn() == true) {
        setState(() {
          isLogedIn = true;
          name = sharedUserValue.name;
          email = sharedUserValue.email;
          phone = sharedUserValue.phone;
          imgUrl = sharedUserValue.imgUrl;
          isLoaded = true;
        });
      } else {
        setState(() {
          isLogedIn = false;
          isLoaded = true;
        });
      } //your home page is loaded
    }
  }

  @override
  void initState() {
    super.initState();

    _checkIsLogin();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        body: !isLoaded
            ? Center(
                child: new CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.indigo),
              ))
            : !isLogedIn
                ? buttonCreateCount()
                : new Container(
                    child: new ListView(
                    children: <Widget>[
                      new Center(
                        child: new Column(
                          children: <Widget>[
//------------------------------------------------------------------------------
                            _countInfo(name, email, imgUrl),
//------------------------------------------------------------------------------
                            OrdersDetailsWidget(),
//------------------------------------------------------------------------------
                            MoreOptionWidget()
//------------------------------------------------------------------------------
                          ],
                        ),
                      ),
                    ],
                  )));
    //new Text("name : $name\nemail : $email\nphone : $phone"));
  }

////////////////////////////////////////////////////////////////////////////////
  Widget buttonCreateCount() {
    return Center(
        child: new RawMaterialButton(
      fillColor: Colors.white,
      splashColor: Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              'Creat Acount',
              style: TextStyle(color: ThemeColors.PrimaryColor),
            ),
            const SizedBox(
              width: 8.0,
            ),
            const Icon(
              Icons.play_circle_outline,
              color: ThemeColors.AccentColor,
            ),
          ],
        ),
      ),
      onPressed: () {
        _goToCreateCount();
      },
      shape: const StadiumBorder(),
    ));
  }

////////////////////////////////////////////////////////////////////////////////
  void _goToCreateCount() {
    Navigator.pushReplacement(
      context,
      new MaterialPageRoute(builder: (context) => new RegisterPage()),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
Widget _countInfo(String name, String email, String imageUrl) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Align(
      alignment: Alignment.centerLeft,
      child: new Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //--------------------------------------------------------------------
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: 96.0,
                height: 96.0,
                child:
                    CircleAvatar(backgroundImage: new NetworkImage(imageUrl))),
          ),
          //--------------------------------------------------------------------
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  name,
                  style: TextStyle(
                      fontSize: 32.0,
                      color: ThemeColors.PrimaryColor_Dark,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w900),
                ),
              ),
              Container(alignment: Alignment.centerLeft, child: Text(email)),
              Container(
                height: 32,
                margin: const EdgeInsets.only(top: 8.0),

                decoration: new BoxDecoration(
                  border: new Border.all(color: Colors.grey[300]),
                  borderRadius: BorderRadius.all(Radius.circular(
                          16.0) //                 <--- border radius here
                      ),
                ),
                //------------------------------------------------------------

                child: RawMaterialButton(
                  // fillColor: Colors.grey,
                  //splashColor: Colors.blueGrey,
                  highlightColor: Colors.grey,
                  elevation: 0.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 6.0, horizontal: 30.0),
                    child: const Text(
                      'EDIT PROFILE',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w900),
                    ),
                  ),
                  shape: const StadiumBorder(),

                  //------------------------------------------------------------

                  onPressed: null,

                  //------------------------------------------------------------
                ),
              )
            ]),
          )
        ],
      ),
    ),
  );
}
