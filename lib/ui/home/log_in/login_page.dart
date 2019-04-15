
import 'package:flutter/material.dart';
import 'package:your_doctor/data/user/base/event_object.dart';
import 'package:your_doctor/data/user/user_data.dart';
import 'package:your_doctor/module/login_user_presenter.dart';
import 'package:your_doctor/ui/customviews/progress_dialog.dart';
import 'package:your_doctor/ui/home/log_in/register_page.dart';
import 'package:your_doctor/ui/main_page.dart';
import 'package:your_doctor/util/app_shared_preferences.dart';
import 'package:your_doctor/util/constant.dart';
import 'forgottenPassword.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';

class LoginPage extends StatefulWidget {
  @override
  createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> implements LogInContract {
  final globalKey = new GlobalKey<ScaffoldState>();

  ProgressDialog progressDialog =
  ProgressDialog.getProgressDialog(ProgressDialogTitles.USER_LOG_IN);

  TextEditingController emailController = new TextEditingController(text: "");

  TextEditingController passwordController =
  new TextEditingController(text: "");

  User user;
  LogInPresenter _presenter;

  LoginPageState() {
    _presenter = new LogInPresenter(this);
  }

//------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: globalKey,
        backgroundColor: ThemeColors.CanvasColor,
        body: new Stack(
          children: <Widget>[_loginContainer(), progressDialog],
        ));
  }

//------------------------------------------------------------------------------
  Widget _loginContainer() {
    return new Container(
        child: new ListView(
          children: <Widget>[
            new Center(
              child: new Column(
                children: <Widget>[
//------------------------------------------------------------------------------
                  //    _appIcon(),
//------------------------------------------------------------------------------
                  _formContainer(),
//------------------------------------------------------------------------------
                ],
              ),
            ),
          ],
        ));
  }

//------------------------------------------------------------------------------
/*
  Widget _appIcon() {
    return new Container(
      decoration: new BoxDecoration(color: ThemeColors.Dark_Primary_Color),
      child: new Image(
        image: new NetworkImage(
            "https://mir-s3-cdn-cf.behance.net/project_modules/disp/0fe5f968670871.5b64c2565ece3.png"),
        height: 120,
        width: 120.0,
      ),
      margin: EdgeInsets.only(top: 20.0),
    );
  }
                 */
//------------------------------------------------------------------------------
  Widget _formContainer() {
    return new Container(
      child: new Form(
          child: new Theme(
              data: new ThemeData(
                  primarySwatch: ThemeColors.Material_Accent_Color),
              child: new Column(
                children: <Widget>[
//------------------------------------------------------------------------------
                  Container(
                    margin: EdgeInsets.only(bottom: 30, top: 50),
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
                          right: 40.0, left: 16.0, bottom: 40.0),
                      child: Column(
                        children: <Widget>[
                          _emailContainer(), Divider(),
//------------------------------------------------------------------------------
                          _passwordContainer(),
                        ],
                      ),
                    ),
                  ),
//------------------------------------------------------------------------------

                  _forgetPasswordLabel(),
                  Divider(height: 20,color: Colors.transparent,),


//=======================================================




                  _loginButtonContainer(),
//------------------------------------------------------------------------------
                  _registerNowLabel(),
//------------------------------------------------------------------------------
                ],
              ))),
      margin: EdgeInsets.only(
        top: 20.0,
        left: 25.0,
        right: 25.0,
      ),
    );
  }

//------------------------------------------------------------------------------
  Widget _emailContainer() {
    return new Container(
      child: new TextFormField(
          controller: emailController,
          decoration: InputDecoration(
              icon: new Icon(
                LineAwesomeIcons.user,
                color: ThemeColors.PrimaryColor_Dark,
              ),
              labelText: Texts.EMAIL,
              labelStyle: TextStyle(fontSize: 18.0)),
          keyboardType: TextInputType.emailAddress),
      //  margin: EdgeInsets.only(bottom: 2.0)
    );
  }

//------------------------------------------------------------------------------
  Widget _passwordContainer() {
    return new Container(
      child: new TextFormField(
        controller: passwordController,
        decoration: InputDecoration(
            icon: new Icon(
              Icons.lock_outline,
              color: ThemeColors.PrimaryColor_Dark,
            ),
            labelText: Texts.PASSWORD,
            labelStyle: TextStyle(fontSize: 18.0)),
        keyboardType: TextInputType.text,
        obscureText: true,
      ),
      //   margin: EdgeInsets.only(bottom: 30.0)
    );
  }

//------------------------------------------------------------------------------
  Widget _loginButtonContainer() {
    return new Container(
        width: 170,
        decoration: new BoxDecoration(
            color: ThemeColors.PrimaryColor_Dark,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: new MaterialButton(
          textColor: Colors.white,
          padding: EdgeInsets.all(15.0),
          onPressed: _loginButtonAction,
          child: new Text(
            Texts.LOGIN,
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
        ),
        margin: EdgeInsets.only(bottom: 30.0));
  }

//------------------------------------------------------------------------------
  Widget _registerNowLabel() {
    return new GestureDetector(
      onTap: _goToRegisterScreen,
      child: new Container(
          child: Row(
            children: <Widget>[
              Text(
                "Not Registered !! ",
                style: TextStyle(fontSize: 16.0, color: Colors.grey),
              ),
              Text(
                Texts.REGISTER_NOW,
                style: TextStyle(
                    fontSize: 16.0,
                    color: ThemeColors.AccentColor,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          margin: EdgeInsets.only(bottom: 30.0)),
    );
  }

//------------------------------------------------------------------------------
  void _loginButtonAction() {
    if (emailController.text == "") {
      globalKey.currentState.showSnackBar(new SnackBar(
        content: new Text(SnackBarText.ENTER_EMAIL),
      ));
      return;
    }

    if (passwordController.text == "") {
      globalKey.currentState.showSnackBar(new SnackBar(
        content: new Text(SnackBarText.ENTER_PASS),
      ));
      return;
    }
    FocusScope.of(context).requestFocus(new FocusNode());
    progressDialog.showProgress();
    setState(() {
      _presenter.loadLogIn(emailController.text, passwordController.text);
    });

    //_loginUser(emailController.text, passwordController.text);
  }

//------------------------------------------------------------------------------
  void _loginUser(String id, String password) async {}

//------------------------------------------------------------------------------
  void _goToHomeScreen() {
    Navigator.push(
      context,
      new MaterialPageRoute(
          builder: (context) => new MainPage(
            fromBack: true,
            isLogedIn: true,
            pagId: 2,
          )),
    );
  }

//------------------------------------------------------------------------------
  void _goToRegisterScreen() {
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new RegisterPage()),
    );
  }

  @override
  void onLoadLogInCompleted(EventObject data) {
    // MainPageCallback _callback;

    setState(() {
      switch (data.id) {
        case EventConstants.LOGIN_USER_SUCCESSFUL:
          {
            setState(() {
              AppSharedPreferences.setUserLoggedIn(true);
              // _callback.onLogIn(true);
              AppSharedPreferences.setUserProfile(data.object);
              globalKey.currentState.showSnackBar(new SnackBar(
                content: new Text(SnackBarText.LOGIN_SUCCESSFUL),
              ));
              progressDialog.hideProgress();
              _goToHomeScreen();
            });
          }
          break;
        case EventConstants.LOGIN_USER_UN_SUCCESSFUL:
          {
            setState(() {
              globalKey.currentState.showSnackBar(new SnackBar(
                content: new Text(SnackBarText.LOGIN_UN_SUCCESSFUL),
              ));
              progressDialog.hideProgress();
            });
          }
          break;
        case EventConstants.NO_INTERNET_CONNECTION:
          {
            setState(() {
              globalKey.currentState.showSnackBar(new SnackBar(
                content: new Text(SnackBarText.NO_INTERNET_CONNECTION),
              ));
              progressDialog.hideProgress();
            });
          }
          break;
      }
    });

    // TODO: implement onLoadLogInComplete
  }

  @override
  void onLoadLogIngError() {
    // TODO: implement onLoadLogIngError
  }


//------------------------------------------------------------------------------
  _forgetPasswordLabel() {

    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(8),
      height: 40,color: Color(0xaaeeeeee),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                ForgotPasswordPage()),
          );
        },
        child: Text(
          "Forgot Password?",
          style: TextStyle(color: ThemeColors.PrimaryColor),
        ),
      ),
    );
  }







}
