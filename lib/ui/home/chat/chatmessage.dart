import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:your_doctor/data/chat/message_data.dart';
const String _name = "Anonymous";


class ChatMessage extends StatelessWidget {
  final String text;
  final bool isMe;
  final String id;
  final String date;

// constructor to get text from textfield
  ChatMessage({
    @required this.text,
    @required this.isMe,
    @required this.id,
    @required this.date

  });

  @override
  Widget build(BuildContext context) {
    return isMe ? new Container(
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
                  new Text(_name, style: Theme
                      .of(context)
                      .textTheme
                      .subhead,textAlign:TextAlign.left),
                  new Container(
                    constraints: new BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width /1.5),
                    child: Text(text,textAlign:TextAlign.left),
                  )
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
        )
    )
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
                  new Text(_name, style: Theme
                      .of(context)
                      .textTheme
                      .subhead, textAlign: TextAlign.right,),

                  new Container(
                    constraints: new BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width /1.5),
                    child: Text(text),
                  )

                ],
              ),
            ),

          ],
        )
    );
  }
}