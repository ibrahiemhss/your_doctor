import 'package:flutter/material.dart';
import 'package:your_doctor/data/chat/message_data.dart';


/// ChatMessage is base abstract class for outgoing and incoming message widgets
abstract class ChatMessages extends Widget {
  /// Message content
  Messages get message;

  /// Controller of animation for message widget
  AnimationController get animationController;
}
