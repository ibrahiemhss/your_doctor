import 'dart:async';

import 'package:your_doctor/data/chat/message_data.dart';

class MockMessagesRepository implements GetMessagesRepository {
  @override
  Future<List<Messages>> getMessages(String user_id,String otherId) async {
    // TODO: implement getMessages
    return new Future.value(data);
  }
}

var data = <Messages>[
  new Messages(
    msg_from: "1",
    isImage: "no",
    msg_content: "hello",
  ),
  new Messages(
    msg_from: "2",
    isImage: "false",
    msg_content: "hello",
  ),


];
