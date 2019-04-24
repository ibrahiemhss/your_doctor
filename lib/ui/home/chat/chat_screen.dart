import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:your_doctor/data/chat/base/event_chat_object.dart';
import 'package:your_doctor/data/chat/message_data.dart';
import 'package:your_doctor/module/messages_presenter.dart';
import 'package:your_doctor/ui/home/chat/chatmessage.dart';
import 'package:your_doctor/util/constant.dart';

class ChatScreentest extends StatefulWidget {
  @override
  State createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreentest> implements MessageContract {
  ChatScreenState() {
    _messagePresenter = new MessagePresenter(this);
  }

  bool _isLoading;
  final TextEditingController _chatController = new TextEditingController();
  final List<ChatMessage> _messagesWidgets = <ChatMessage>[];
  StreamController _messagesStreamController;
  List<Messages> listMessage = [];
  MessagePresenter _messagePresenter;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    _messagePresenter.loadGetMessage("1");
    _messagesStreamController = new StreamController();
  }

  void _handleSubmit([String text, bool isMe, String id, String date]) {
    _chatController.clear();
    ChatMessage message = new ChatMessage(
      text: text,
      isMe: isMe,
      id: id,
      date: date,
    );
    setState(() {
      _messagesWidgets.insert(0, message);
    });
  }

  Widget _chatEnvironment() {
    return IconTheme(
      data: new IconThemeData(color: Colors.blue),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                decoration: new InputDecoration.collapsed(
                    hintText: "Starts typing ..."),
                controller: _chatController,
                onSubmitted: _handleSubmit,
              ),
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: () => _handleSubmit(
                    _chatController.text, true, "4", "this/// is/// date"),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ThemeColors.Canvas,
      child: new Column(
        children: <Widget>[
          new Flexible(
            child: ListView.builder(
              padding: new EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messagesWidgets[index],
              itemCount: _messagesWidgets.length,
            ),
          ),
          new Divider(
            height: 1.0,
          ),
          new Container(
            decoration: new BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _chatEnvironment(),
          )
        ],
      ),
    );
  }

  @override
  void onLoadMessagesCompleted(List<Messages> items) {
    setState(() {
      for (var i = 0; i < items.length; i++) {
        _handleSubmit(
            items[i].text, items[i].isMe, items[i].id, items[i].timeStamp);
      }
      _isLoading = false;
    });
  }

  @override
  void onLoadMessagesError() {
    // TODO: implement onLoadMessagesError
  }

  @override
  void onLoadSendingMessageCompleted(EventMessageObject item) {
    // TODO: implement onLoadSendingMessageCompleted
  }
}
