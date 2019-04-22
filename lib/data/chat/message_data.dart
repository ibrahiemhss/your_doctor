import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

part 'message_data.g.dart';
/// Message is class defining message data (id and text)
class Messages {
  /// id is unique ID of message
   String id;

  /// to whoe sent this message
  final String to;
  final String from;
   final int type;

  /// text is content of message
  final String text;
  /// _uuid is unique ID generator
  static var _uuid = Uuid();

  Messages({this.text,this.type, this.id, this.from, this.to}) {
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