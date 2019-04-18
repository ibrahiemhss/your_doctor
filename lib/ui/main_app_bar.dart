import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:your_doctor/util/constant.dart';

class MainBarWidget extends StatelessWidget {
  MainBarWidget(
      {@required this.onPressedChat,
      @required this.onPressedBell,
      @required this.isCreatingAcount});

  final GestureTapCallback onPressedChat;
  final GestureTapCallback onPressedBell;
  final bool isCreatingAcount;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: !isCreatingAcount
          ? new SizedBox.shrink()
          : Row(
              children: <Widget>[
                Container(
                  width: 60,
                  child: RawMaterialButton(
                    child: new Stack(
                      //alignment:new Alignment(x, y)
                      children: <Widget>[
                        new Positioned(
                          left: 35.0,
                          top: 10.0,
                          child: const Icon(
                            LineAwesomeIcons.wechat,
                            color: ThemeColors.PrimaryColor,

                          ),
                        ),
                        new Positioned(
                          top: 20.0,
                          right: 20.0,
                          child: Container(
                              child: Container(
                                  margin: new EdgeInsets.symmetric(
                                      horizontal: 4.0, vertical: 4.0),
                                  child: Text(
                                    "4443",
                                    style: TextStyle(color: Colors.white),
                                  )),
                              decoration: new BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: ThemeColors.AccentColor,
                              )),
                        ),
                      ],
                    ),
                    onPressed: onPressedChat,
                  ),
                ),

///////////////////////////////////////////////////////////////

                // const SizedBox(width:8.0 ,),
///////////////////////////////////////////////////////////////////////////////////////
                RawMaterialButton(
                  child: Container(
                    width: 50,
                    child: new Stack(
                      //alignment:new Alignment(x, y)
                      children: <Widget>[
                        new Positioned(
                          left: 30.0,
                          top: 10.0,
                          child: const Icon(
                            LineAwesomeIcons.sticky_note,
                            color: ThemeColors.PrimaryColor,
                          ),
                        ),
                        new Positioned(
                          right: 10.0,
                          top: 20.0,
                          child: Container(
                              child: Container(
                                  margin: new EdgeInsets.symmetric(
                                      horizontal: 4.0, vertical: 4.0),
                                  child: Text(
                                    "443",
                                    style: TextStyle(color: Colors.white),
                                  )),
                              decoration: new BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: ThemeColors.AccentColor,
                              )),
                        ),
                      ],
                    ),
                  ),
                  onPressed: onPressedBell,
                ),
              ],
            ),
    );
  } //

  // TODO: implement preferredSize
  Size get preferredSize => null;
}
