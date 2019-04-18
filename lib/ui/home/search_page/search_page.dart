import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:your_doctor/ui/home/search_page/search_by_widget.dart';
import 'package:your_doctor/util/constant.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchState createState() => new _SearchState();
}

class _SearchState extends State<SearchPage> with TickerProviderStateMixin {
  TextEditingController searchController = new TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        body: new Container(
            child: new ListView(
      children: <Widget>[
        new Center(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
//------------------------------------------------------------------------------

              _formSearchContainer(),
//------------------------------------------------------------------------------
              SearchByWidget(
                searchVal: searchController.toString(),
              ),
//------------------------------------------------------------------------------
              // RecomendedWidget()
//------------------------------------------------------------------------------
            ],
          ),
        ),
      ],
    )));
    //new Text("name : $name\nemail : $email\nphone : $phone"));
  }

  Widget _formSearchContainer() {
    return new Container(
      child: Form(
        child: new TextFormField(
            controller: searchController,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  size: 28.0,
                ),
                hintText: Texts.SEARCH,
                hintStyle: TextStyle(
                  color: ThemeColors.white100,
                ),
                contentPadding: EdgeInsets.fromLTRB(20.0, 8.0, 20.0, 8.0),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                fillColor: ThemeColors.white40,
                filled: true,
                //labelText: Texts.SEARCH,
                labelStyle: TextStyle(fontSize: 18.0)),
            keyboardType: TextInputType.text),
      ),

      margin: EdgeInsets.only(
        top: 16.0,
        left: 16.0,
        right: 16.0,
      ),

      //  margin: EdgeInsets.only(bottom: 2.0)
    );
  }
}
