import 'dart:async';

import 'package:your_doctor/data/chat/message_data.dart';

class ProdMessagesRepository implements GetMessagesRepository {
  @override
  Future<List<Messages>> getMessages(String id) {
    // TODO: implement getMessages
    return new Future.value(data);
  }
}

var data = <Messages>[
  new Messages(id: "2",type:1, text: "hello", from: "ddd"),
  new Messages(id: "4",type:0, text: "hello", from: "ddd"),
  new Messages(id: "6",type:1, text: "how are y6ou", from: "ddd"),
  new Messages(id: "8",type:0, text: "fine", from: "ddd"),
];
