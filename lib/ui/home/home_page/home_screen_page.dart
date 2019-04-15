
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreenPage extends StatefulWidget {
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomeScreenPage> {


  List<String> selectedItems = [];

  bool _isLoading;
  bool _isSectionLoading;

  // final List<MaterialColor> _colors = [Colors.blue, Colors.indigo, Colors.red];

  _HomePageState() {
  }

  @override
  void initState() {
    super.initState();
    _isLoading = true;

    _isSectionLoading = true;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: _isLoading
            ? new Center(
                child: new CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.indigo),
                ),
              )
            : _hometWidget());
  }

  Widget _hometWidget() {
    double _width = MediaQuery.of(context).size.width;

    print(_width.toString());
    return ListView(
      // crossAxisAlignment: CrossAxisAlignment.center,

      children: <Widget>[
        //todo==================== Categories List Ui ================================


      ],
    );
  }







}
