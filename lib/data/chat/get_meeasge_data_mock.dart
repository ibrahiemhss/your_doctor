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
    name: "ahmed",
    isImage: false,
    text: "hello",
  ),
  new Messages(
    id: "4",
    isMe: false,
    timeStamp: "2018-09-12-13:00:00.000",
    name: "hameed",
    isImage: false,
    text: "hello",
  ),
  new Messages(
    id: "6",
    isMe: true,
    timeStamp: "2018-09-12-13:00:00.000",
    name: "ahmed",
    isImage: false,
    text: "how are y6ou",
  ),
  new Messages(
    id: "2",
    isMe: true,
    timeStamp: "2018-09-12-13:00:00.000",
    name: "ahmed",
    imageUrl:  "https:\/\/assets.myntassets.com\/h_1440,q_100,w_1080/v1\/assets\/images\/1547908\/2016\/10\/21\/11477039060469-Nike-Men-Sports-Shoes-951477039060284-5.jpg",
    isImage: true,
    text: "hello",
  ),

];
