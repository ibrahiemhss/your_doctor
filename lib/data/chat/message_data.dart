import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:your_doctor/data/chat/base/event_chat_object.dart';

part 'message_data.g.dart';

/// Message is class defining message data (id and text)
class Messages {
  /// id is unique ID of message
  final int msg_id;
  final String sender_name;
  final String reciver_name;
  final String msg_from;
  final String msg_to;
  final String isImage;

  //final String timeStamp;
  final String msg_content;
  final String msg_created_at;

  Messages(
      {this.msg_id,
        this.sender_name,
        this.reciver_name,

        this.msg_from,
      this.msg_to,
      this.msg_content,
      this.isImage,
      this.msg_created_at}) {}

  factory Messages.fromJson(Map<String, dynamic> json) {
    return new Messages(
      msg_id: json['msg_id'] as int,
      sender_name: json['sender_name'] as String,
      reciver_name: json['reciver_name'] as String,

      msg_from: json['msg_from'] as String,
      msg_to: json['msg_to'] as String,
      msg_content: json['msg_content'] as String,
      isImage: json['is_image'] as String,
      msg_created_at: json['msg_created_at'] as String,
    );
  }

  Messages.fromMap(Map<String, dynamic> map)
      : msg_id = map['msg_id'],
        sender_name = map['sender_name'],
        reciver_name = map['reciver_name'],

      msg_from = map['msg_from'],
        msg_to = map['msg_to'],
        msg_content = map['msg_content'],
        isImage = map['is_image'],
        msg_created_at = map['msg_created_at'];

  /// Class constructor

  /// Class constructor

}

abstract class GetMessagesRepository {
  Future<List<Messages>> getMessages(String msg_from, String msg_to);
}

abstract class SendingMessageRepository {
  Future<EventMessageObject> sendMessage(String msg_from, String msg_to,
      String sender_name, String reciver_name,String msg_content,String msg_pic_file,  String isImage,String msg_created_at);
}

