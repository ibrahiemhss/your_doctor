import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:your_doctor/util/constant.dart';

class OrdersDetailsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Container(
          child: new Theme(
              data: new ThemeData(
                  primarySwatch: ThemeColors.Material_Accent_Color),
              child: new Column(
                children: <Widget>[
//------------------------------------------------------------------------------
                  Container(
                    margin: EdgeInsets.only(bottom: 8, top: 8),
                    decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                            color: Color(0x44000000),
                            offset: Offset(1.0, 4.0),
                            blurRadius: 8.0,
                          ),
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 8.0, left: 8.0, bottom: 4.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          _allOrders(context),
//------------------------------------------------------------------------------
                          _itemsDivider(context),
//------------------------------------------------------------------------------
                          _pendingShipment(context),
//------------------------------------------------------------------------------
                          _itemsDivider(context),
//------------------------------------------------------------------------------
                          _pendeningPayments(context),
//------------------------------------------------------------------------------
                          _itemsDivider(context),
//------------------------------------------------------------------------------
                          _finishedOrders(context),
//------------------------------------------------------------------------------
                          //_passwordContainer(),
                        ],
                      ),
                    ),
                  ),
                ],
              ))),
    );
  }
}

////////////////////////////////////////////////////////////////////////////////
_itemsDivider(BuildContext context) {
  double _width;

  final mediaQueryData = MediaQuery.of(context);
  if (mediaQueryData.orientation == Orientation.landscape) {
    _width = MediaQuery.of(context).size.width / 1.310;
  } else {
    _width = MediaQuery.of(context).size.height / 2.30;
  }
  return Container(
    alignment: Alignment.centerRight,
    width: _width,
    color: Colors.grey[200],
    height: 1.0,
  );
}

////////////////////////////////////////////////////////////////////////////////
Widget _allOrders(BuildContext context) {
  double _width;

  final mediaQueryData = MediaQuery.of(context);
  if (mediaQueryData.orientation == Orientation.landscape) {
    _width = MediaQuery.of(context).size.width / 4;
  } else {
    _width = MediaQuery.of(context).size.height / 4.5;
  }
  return RawMaterialButton(
    fillColor: Colors.white,
    splashColor: Colors.blueGrey,
    elevation: 0.0,
    child: Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(child: const Icon(Icons.view_headline)),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Container(
              // width: _width,
              child: const Text(
                'All My Orders',
                textAlign: TextAlign.left,
                style: TextStyle(color: ThemeColors.PrimaryColor_Dark),
              ),
            ),
          ),
          Container(
            width: _width,
          ),
          Container(
              margin: EdgeInsets.only(top: 4.0),
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 10.0,
                ),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              )),
        ],
      ),
    ),

    onPressed: () {},
    //onPressed,
  );
}

////////////////////////////////////////////////////////////////////////////////
Widget _pendingShipment(BuildContext context) {
  double _width;

  final mediaQueryData = MediaQuery.of(context);
  if (mediaQueryData.orientation == Orientation.landscape) {
    _width = MediaQuery.of(context).size.width / 4;
  } else {
    _width = MediaQuery.of(context).size.height / 4.5;
  }
  return RawMaterialButton(
    fillColor: Colors.white,
    splashColor: Colors.blueGrey,
    elevation: 0.0,
    child: Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(child: const Icon(CupertinoIcons.location)),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Container(
              // width:_width,
              child: const Text(
                'Pending Shipments',
                textAlign: TextAlign.left,
                style: TextStyle(color: ThemeColors.PrimaryColor_Dark),
              ),
            ),
          ),
          Container(
            width: _width,
          ),
          Container(
              margin: EdgeInsets.only(top: 4.0),
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 10.0,
                ),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              )),
        ],
      ),
    ),

    onPressed: () {},
    //onPressed,
  );
}

////////////////////////////////////////////////////////////////////////////////
Widget _pendeningPayments(BuildContext context) {
  double _width;

  final mediaQueryData = MediaQuery.of(context);
  if (mediaQueryData.orientation == Orientation.landscape) {
    _width = MediaQuery.of(context).size.width / 4;
  } else {
    _width = MediaQuery.of(context).size.height / 4.5;
  }
  return RawMaterialButton(
    fillColor: Colors.white,
    splashColor: Colors.blueGrey,
    elevation: 0.0,
    child: Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(child: const Icon(Icons.payment)),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Container(
              // width:_width ,
              alignment: Alignment.centerLeft,

              child: const Text(
                'Pending Payments',
                textAlign: TextAlign.left,
                style: TextStyle(color: ThemeColors.PrimaryColor_Dark),
              ),
            ),
          ),
          Container(
            width: _width,
          ),
          Container(
              margin: EdgeInsets.only(top: 4.0),
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 10.0,
                ),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              )),
        ],
      ),
    ),

    onPressed: () {},
    //onPressed,
  );
}

////////////////////////////////////////////////////////////////////////////////
Widget _finishedOrders(BuildContext context) {
  double _width;

  final mediaQueryData = MediaQuery.of(context);
  if (mediaQueryData.orientation == Orientation.landscape) {
    _width = MediaQuery.of(context).size.width / 4;
  } else {
    _width = MediaQuery.of(context).size.height / 4.5;
  }
  return RawMaterialButton(
    fillColor: Colors.white,
    splashColor: Colors.blueGrey,
    elevation: 0.0,
    child: Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(child: const Icon(Icons.done_outline)),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Container(
              //   width: _width,
              child: const Text(
                'Finished Orders',
                textAlign: TextAlign.left,
                style: TextStyle(color: ThemeColors.PrimaryColor_Dark),
              ),
            ),
          ),
          Container(
            width: _width,
          ),
          Container(
              margin: EdgeInsets.only(top: 4.0),
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 10.0,
                ),
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              )),
        ],
      ),
    ),

    onPressed: () {},
    //onPressed,
  );
}
