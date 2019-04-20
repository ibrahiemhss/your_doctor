import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:your_doctor/ui/home/search_page/latest_doctors_widget.dart';
import 'package:your_doctor/ui/home/search_page/search_by_widget.dart';
import 'package:your_doctor/util/constant.dart';

class DoctorDetailWidget extends StatefulWidget {
  @override
  _DoctorDetailWidgetState createState() => new _DoctorDetailWidgetState();
}

class _DoctorDetailWidgetState extends State<DoctorDetailWidget> with TickerProviderStateMixin {
  TextEditingController searchController = new TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        body: new Container(
            decoration: ThemeColors.Canvas,
            child: new ListView(
              children: <Widget>[
                new Center(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
//------------------------------------------------------------------------------

                      _doctorDetalsContainer(),
//------------------------------------------------------------------------------
                      _itemsDivider(context),
//------------------------------------------------------------------------------
                      _chatContainer(),
//------------------------------------------------------------------------------
                    ],
                  ),
                ),
              ],
            )));
    //new Text("name : $name\nemail : $email\nphone : $phone"));
  }

////////////////////////////////////////////////////////////////////////////////
  _itemsDivider(BuildContext context) {
    double _width;

    final mediaQueryData = MediaQuery.of(context);
    if (mediaQueryData.orientation == Orientation.landscape) {
      _width = MediaQuery.of(context).size.width / 1.310;
    } else {
      _width = MediaQuery.of(context).size.height / 1.95;
    }
    return   Container(
      alignment: Alignment.centerRight,
      width: _width,
      color: Colors.grey[200],
      height: 1.0,

    );
  }
////////////////////////////////////////////////////////////////////////////////
  Widget _doctorDetalsContainer() {
    return new Container(
      child: Row(children: <Widget>[


      ],),

      margin: EdgeInsets.only(
        top: 16.0,
        left: 16.0,
        right: 16.0,
      ),

      //  margin: EdgeInsets.only(bottom: 2.0)
    );
  }


  ////////////////////////////////////////////////////////////////////////////////
  Widget _chatContainer() {
    return new Container(
      child: Row(children: <Widget>[


      ],),

      margin: EdgeInsets.only(
        top: 16.0,
        left: 16.0,
        right: 16.0,
      ),

      //  margin: EdgeInsets.only(bottom: 2.0)
    );
  }
}
