import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:your_doctor/data/chat/base/event_chat_object.dart';

part 'message_data.g.dart';
/// Message is class defining message data (id and text)
class Messages {
  /// id is unique ID of message
   String id;

  /// to whoe sent this message
   final bool isMe;
   final String idFrom;
  /// text is content of message
   ///
   final String timeStamp;

   final String text;
  /// _uuid is unique ID generator
  static var _uuid = Uuid();

  Messages({this.text,this.isMe,this.timeStamp, this.id,this.idFrom}) {
    if (id == null) {
      id = _uuid.v4();
    }
  }

  /// Class constructor

  /// Class constructor



  factory Messages.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

}
abstract class GetMessagesRepository {
  Future<List<Messages>> getMessages(String id);
}
abstract class SendingMessageRepository {
  Future<EventMessageObject> sendMessage(String id,String to,String text);
}