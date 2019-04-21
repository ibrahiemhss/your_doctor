import 'package:meta/meta.dart';

import 'message_data.dart';

/// MessageIncoming is class defining incoming message data (id and text)
class MessageIncoming extends Messages {
  /// Constructor
  MessageIncoming({String id,String from, @required String text})
      : super(id: id,from:from, text: text);

  MessageIncoming.copy(MessageIncoming original)
      : super(id: original.id,from:original.from, text: original.text);
}

