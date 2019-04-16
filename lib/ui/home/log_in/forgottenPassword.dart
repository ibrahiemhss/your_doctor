import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:your_doctor/util/constant.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  get emailController => null;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body:
      Container(
        decoration:ThemeColors.Canvas,
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(30),
        child: ListView(
          children: <Widget>[

            Divider(height:20),
            Image.asset("images/urdr.png",height:200 ,width: 200,),
            ///==============================
            Divider(height:20),

            Text("Please enter your  EMail "
                "\nand wait afew seconds to get a link to "
                "\nreset your password,",style: TextStyle(color: ThemeColors.white100),),

            ///==============================
            Divider(height: 40,
                color:Colors.transparent),
            ///==========================
            Padding(
              padding: const EdgeInsets.only(left:8.0,right: 16),
              child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      icon: new Icon(
                        LineAwesomeIcons.user,
                        color: ThemeColors.PrimaryColor_Dark,
                      ),
                      labelText: Texts.EMAIL,
                      labelStyle: TextStyle(fontSize: 18.0)),
                  keyboardType: TextInputType.emailAddress),
            ),
            ///======================================
            Divider(height: 30,
              ),
            ///====================Button====================
            Container(
                width: 170,
                decoration: new BoxDecoration(
                    color: ThemeColors.PrimaryColor_Dark,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: new MaterialButton(
                  padding: EdgeInsets.all(15.0),
                  onPressed: null,
                  child: new Text(
                    "Send",
                    style: new TextStyle(color:ThemeColors.white100,fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                ),
                margin: EdgeInsets.only(bottom: 30.0)),
          ],
        ),
      ),);
  }
}
