import 'package:meta/meta.dart';
import 'package:your_doctor/data/chat/base/event_chat_object.dart';

import 'message_data.dart';

/// Outgoing message statuses
/// NEW - message just created and is not sent yet
/// SENT - message is sent to the server successfully
/// FAILED - error has happened while sending message
enum MessageOutgoingStatus { NEW, SENT, FAILED }

/// MessageOutgoing is class defining outgoing message data (id and text) and status
class MessageOutgoing extends Messages {
  /// Outgoing message status
  MessageOutgoingStatus status;

  /// Constructor
  MessageOutgoing(
      {String id,
      @required String to,  @required String text,
        MessageOutgoingStatus status = MessageOutgoingStatus.NEW})
      : this.status = status,
        super(id: id,to:to, text: text);

  MessageOutgoing.copy(MessageOutgoing original)
      : this.status = original.status,
        super(id: original.id,to:original.to, text: original.text);
}
abstract class GetOutgoingMessagesRepository {
  Future<List<MessageOutgoing>> getMessages(String id);
}

abstract class SendMessageRepository {
  Future<EventMessageObject> sendMessage(String id,String to,String text);
}