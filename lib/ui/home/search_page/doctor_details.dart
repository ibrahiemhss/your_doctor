import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:your_doctor/data/doctors/doctors_data.dart';
import 'package:your_doctor/module/doctors_presenter.dart';
import 'package:your_doctor/ui/home/search_page/latest_doctors_widget.dart';
import 'package:your_doctor/ui/home/search_page/search_by_widget.dart';
import 'package:your_doctor/util/constant.dart';

class DoctorDetailWidget extends StatefulWidget {
  final String id;

  DoctorDetailWidget({@required this.id});

  @override
  _DoctorDetailWidgetState createState() =>
      new _DoctorDetailWidgetState(id: id);
}

class _DoctorDetailWidgetState extends State<DoctorDetailWidget>
    with TickerProviderStateMixin
    implements DoctorsContract {
  TextEditingController searchController = new TextEditingController(text: "");

  final String id;
  Doctors _doctors;
  bool _isLoading;

  DoctorsPresenter _doctorsPresenter;

  _DoctorDetailWidgetState({@required this.id}) {
    _doctorsPresenter = new DoctorsPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _doctorsPresenter.loadDoctorDetails(id);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: appBar(),
        body: new Container(
            decoration: ThemeColors.Canvas,
            child: new ListView(
              children: <Widget>[
                new Center(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
//------------------------------------------------------------------------------

                      _doctorDetailsContainer(),
//------------------------------------------------------------------------------
                      _itemsDivider(context),
//------------------------------------------------------------------------------
                      //_chatContainer(),
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
    return Container(
      alignment: Alignment.centerRight,
      color: Colors.grey[200],
      height: 1.0,
    );
  }

////////////////////////////////////////////////////////////////////////////////
  Widget _doctorDetailsContainer() {
    return new Container(
      child: _isLoading
          ? new Center(
              child: new CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(Colors.indigo),
              ),
            )
          : Row(
              children: <Widget>[
                CircleAvatar(
                    backgroundImage: new NetworkImage(_doctors.doctor_img)),
              ],
            ),

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
        child: new FlatButton(
      splashColor: Color(0xffaaaaaa),
      color: ThemeColors.AccentColor,
      shape: StadiumBorder(),
      onPressed: () => _goToChat(),
      child: Text(
        Texts.CHAT_DOCTOR,
        style: new TextStyle(
            color: ThemeColors.white100,
            fontWeight: FontWeight.bold,
            fontSize: 16.0),
      ),
    )

        //  margin: EdgeInsets.only(bottom: 2.0)
        );
  }

////////////////////////////////////////////////////////////////////////////////
  void _goToChat() {
    // Navigator.push(
    //  context,
    // new MaterialPageRoute(builder: (context) => new HomeChatScreen()),
    // );
  }

////////////////////////////////////////////////////////////////////////////////
  Widget appBar() {
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
      title: Text("your dotor"),
      backgroundColor: ThemeColors.CanvasColor,
    );
  }

  @override
  void onLoadDoctorDetialsCompleted(Doctors item) {
    // TODO: implement onLoadDoctorDetialsCompleted

    setState(() {
      _doctors = item;
      _isLoading = false;
    });
  }

  @override
  void onLoadDoctorsCompleted(List<Doctors> items) {
    // TODO: implement onLoadDoctorsCompleted
  }

  @override
  void onLoadDoctorsError() {
    // TODO: implement onLoadDoctorsError
  }
}
