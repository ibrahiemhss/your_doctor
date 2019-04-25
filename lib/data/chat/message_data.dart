import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:your_doctor/data/chat/base/event_chat_object.dart';

part 'message_data.g.dart';

/// Message is class defining message data (id and text)
class Messages {
  /// id is unique ID of message
  int id;
  int user_id;
  int otherId;

  final String name;
  final String imageUrl;
  final bool isMe;
  final bool isImage;
  final String timeStamp;
  final String text;

  /// _uuid is unique ID generator
  static int _uuid = int.parse(Uuid().toString());

  Messages(
      { this.id,
        this.user_id,
        this.otherId,
        this.name,
      this.text,
      this.isImage,
      this.imageUrl,
      this.isMe,
      this.timeStamp}) {

  }

  /// Class constructor

  /// Class constructor

  factory Messages.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

abstract class GetMessagesRepository {
  Future<List<Messages>> getMessages(int id,int otherId);
}

abstract class SendingMessageRepository {
  Future<EventMessageObject> sendMessage(int id,int otherId, String text, String isImage,String image);
}
