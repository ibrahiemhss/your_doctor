import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:your_doctor/data/chat/base/event_chat_object.dart';

part 'message_data.g.dart';

/// Message is class defining message data (id and text)
class Messages {
  /// id is unique ID of message
 final int id;
 final int user_id;
  final int otherId;

  final String imageUrl;
  final String isImage;
  //final String timeStamp;
  final String text;


  Messages(
      { this.id,
        this.user_id,
        this.otherId,
      this.text,
      this.isImage,
      this.imageUrl}) {

  }
  factory Messages.fromJson(Map<String, dynamic> json) {
    return new Messages(
        id: json['id'] as int,
        user_id: json['user_id'] as int,
        otherId: json['other_id'] as int,
        text: json['content'] as String,
        isImage: json['is_image'] as String,
        imageUrl: json['image'] as String);

  }

  Messages.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        user_id = map['user_id'],
        otherId = map['other_id'],
        text = map['content'],
        isImage = map['is_image'],
        imageUrl = map['image'];
  /// Class constructor

  /// Class constructor

}

abstract class GetMessagesRepository {
  Future<List<Messages>> getMessages(int id,int otherId);
}

abstract class SendingMessageRepository {
  Future<EventMessageObject> sendMessage(int id,int otherId, String text, String isImage,String image);
}
