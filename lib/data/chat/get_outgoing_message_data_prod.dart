import 'dart:async';

import 'package:your_doctor/data/articles/articles_data.dart';
import 'package:your_doctor/data/chat/get_incomming_message_data_prod.dart';
import 'package:your_doctor/data/chat/message_data.dart';
import 'package:your_doctor/data/chat/message_data_outgoing.dart';
import 'package:your_doctor/data/doctors/doctors_data.dart';

class ProdGetMessageOutgoingRepository implements GetOutgoingMessagesRepository {
  @override
  Future<List<MessageOutgoing>> getMessages(String id) {
    // TODO: implement getMessages
    return new Future.value(data);
  }
}

var data = <MessageOutgoing>[
  new MessageOutgoing(id: "1", text: "ahmed", to: "ddd"),
  new MessageOutgoing(id: "3", text: "ahmed", to: "ddd"),
  new MessageOutgoing(id: "5", text: "ahmed", to: "ddd"),
  new MessageOutgoing(id: "7", text: "ahmed", to: "ddd"),
];
