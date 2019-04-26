import 'dart:async';

import 'package:your_doctor/data/chat/message_data.dart';

class MockMessagesRepository implements GetMessagesRepository {
  @override
  Future<List<Messages>> getMessages(String user_id,String otherId) {
    // TODO: implement getMessages
    return new Future.value(data);
  }
}

var data = <Messages>[
  new Messages(
    user_id: "1",
    isImage: "no",
    text: "hello",
  ),
  new Messages(
    user_id: "2",
    isImage: "false",
    text: "hello",
  ),


];
