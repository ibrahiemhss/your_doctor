import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:your_doctor/util/constant.dart';
class ChatMessage extends StatelessWidget {
  final String userIdSent;
  final String formId;
  final String text;
  final String name;
  final String imageUrl;
  final String isImage;
  final String date;

  ChatMessage(
      {
        @required this.userIdSent,
        @required this.formId,
        @required this.text,
        @required this.name,
        @required this.isImage,
        @required this.imageUrl,
        @required this.date});

  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return
//---------------------------if id current user---------------------------------
    

    
      formId==userIdSent ?
      new Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    new Text(name,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700, // light
                            color: Colors.white70),
                        textAlign: TextAlign.left),

//-----------------------------if is Image not text-----------------------------

                    isImage=="y"
                    // Image
                        ? Container(
                      child: Material(
                        child: CachedNetworkImage(
                          placeholder: (context, url) => Container(
                            child: CircularProgressIndicator(
                              valueColor:
                              AlwaysStoppedAnimation<Color>(
                                  ThemeColors.ShadowColor),
                            ),
                            width: 200.0,
                            height: 200.0,
                            padding: EdgeInsets.all(70.0),
                            decoration: BoxDecoration(
                              color: ThemeColors.ShadowColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              Material(
                                child: Image.asset(
                                  'images/img_not_available.jpeg',
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                clipBehavior: Clip.hardEdge,
                              ),
                          imageUrl: imageUrl,
                          width: 200.0,
                          height: 200.0,
                          fit: BoxFit.cover,
                        ),
                        borderRadius:
                        BorderRadius.all(Radius.circular(8.0)),
                        clipBehavior: Clip.hardEdge,
                      ),
                      margin:
                      EdgeInsets.only(bottom: 10.0, right: 10.0),
                    )

//---------------------------els if text----------------------------------------

                        : new Container(
                      decoration: new BoxDecoration(
                          color: ThemeColors.PrimaryColor60,
                          borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(20.0),
                              bottomRight: const Radius.circular(20.0),
                              bottomLeft: const Radius.circular(20.0),
                              topRight: const Radius.circular(2.0))),
                      constraints: new BoxConstraints(
                          maxWidth:
                          MediaQuery.of(context).size.width / 1.5),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(text,
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center),
                      ),
                    ),
                    Text(date, style: TextStyle(color: Colors.white))
                  ],
                ),
              ),
              new Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(left: 4.0),
                child: new CircleAvatar(
                  child: new Image.network(
                      "http://res.cloudinary.com/kennyy/image/upload/v1531317427/avatar_z1rc6f.png"),
                ),
              ),
            ],
          ))

//------------------------------if is not current user -------------------------

          : new Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.only(right: 4.0),
                child: new CircleAvatar(
                  child: new Image.network(
                      "http://res.cloudinary.com/kennyy/image/upload/v1531317427/avatar_z1rc6f.png"),
                ),
              ),
              Container(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      name,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700, // light
                          color: Colors.white70),
                      textAlign: TextAlign.right,
                    ),

//-----------------------------if is Image not text-----------------------------

                    isImage=="y"
                    // Image
                        ? Container(
                      child: Material(
                        child: CachedNetworkImage(
                          placeholder: (context, url) => Container(
                            child: CircularProgressIndicator(
                              valueColor:
                              AlwaysStoppedAnimation<Color>(
                                  ThemeColors.ShadowColor),
                            ),
                            width: 200.0,
                            height: 200.0,
                            padding: EdgeInsets.all(70.0),
                            decoration: BoxDecoration(
                              color: ThemeColors.ShadowColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                            ),
                          ),
                          errorWidget: (context, url, error) =>
                              Material(
                                child: Image.asset(
                                  'images/img_not_available.jpeg',
                                  width: 200.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                                clipBehavior: Clip.hardEdge,
                              ),
                          imageUrl: imageUrl,
                          width: 200.0,
                          height: 200.0,
                          fit: BoxFit.cover,
                        ),
                        borderRadius:
                        BorderRadius.all(Radius.circular(8.0)),
                        clipBehavior: Clip.hardEdge,
                      ),
                      margin:
                      EdgeInsets.only(bottom: 10.0, right: 10.0),
                    )

                    // Sticker
//---------------------------els if text----------------------------------------

                        : new Container(
                      decoration: new BoxDecoration(
                          color: ThemeColors.PrimaryColor60,
                          borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(2.0),
                              bottomRight: const Radius.circular(20.0),
                              bottomLeft: const Radius.circular(20.0),
                              topRight: const Radius.circular(20.0))),
                      constraints: new BoxConstraints(
                          maxWidth:
                          MediaQuery.of(context).size.width / 1.5),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(text,
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center),
                      ),
                    ),
                    Text(date, style: TextStyle(color: Colors.white))
                  ],
                ),
              ),
            ],
          ));;
  }



}
