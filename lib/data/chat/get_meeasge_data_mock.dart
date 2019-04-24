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
  new Messages(
    id: "2",
    isMe: true,
    timeStamp: "2018-09-12-13:00:00.000",
    idFrom: "2",
    text: "hello",
  ),
  new Messages(
    id: "4",
    isMe: false,
    timeStamp: "2018-09-12-13:00:00.000",
    idFrom: "4",
    text: "hello",
  ),
  new Messages(
    id: "6",
    isMe: true,
    timeStamp: "2018-09-12-13:00:00.000",
    idFrom: "6",
    text: "how are y6ou",
  ),
  new Messages(
    id: "8",
    isMe: false,
    timeStamp: "2018-09-12-13:00:00.000",
    idFrom: "7",
    text: "fine",
  ),
  new Messages(
    id: "2",
    isMe: true,
    timeStamp: "2018-09-12-13:00:00.000",
    idFrom: "2",
    text:
        "test my messages length test my messages lengthtest my messages lengthtest my messages lengthtest my messages length",
  ),
  new Messages(
    id: "4",
    isMe: false,
    timeStamp: "2018-09-12-13:00:00.000",
    idFrom: "4",
    text:
        "test my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages length",
  ),
  new Messages(
    id: "6",
    isMe: true,
    timeStamp: "2018-09-12-13:00:00.000",
    idFrom: "6",
    text:
        "test my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages length",
  ),
  new Messages(
    id: "8",
    isMe: false,
    timeStamp: "2018-09-12-13:00:00.000",
    idFrom: "7",
    text:
        "test my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages length",
  ),
  new Messages(
    id: "2",
    isMe: true,
    timeStamp: "2018-09-12-13:00:00.000",
    idFrom: "2",
    text:
        "test my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages length",
  ),
  new Messages(
    id: "4",
    isMe: false,
    timeStamp: "2018-09-12-13:00:00.000",
    idFrom: "4",
    text:
        "test my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages lengthtest my messages length",
  ),
];
