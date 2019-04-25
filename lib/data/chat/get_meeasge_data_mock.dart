import 'dart:async';

import 'package:your_doctor/data/chat/message_data.dart';

class MockMessagesRepository implements GetMessagesRepository {
  @override
  Future<List<Messages>> getMessages(int id,int otherId) {
    // TODO: implement getMessages
    return new Future.value(data);
  }
}

var data = <Messages>[
  new Messages(
    id: 3,
    isImage: "false",
    text: "hello",
  ),
  new Messages(
    id: 2,
    isImage: "false",
    text: "hello",
  ),


];
