import 'package:your_doctor/data/articles/articles_data.dart';
import 'package:your_doctor/data/chat/base/event_chat_object.dart';
import 'package:your_doctor/data/chat/message_data.dart';
import 'package:your_doctor/data/chat/message_data_incoming.dart';
import 'package:your_doctor/data/chat/message_data_outgoing.dart';
import 'package:your_doctor/util/dependency_injection.dart';

abstract class MessageContract {
  void onLoadSendingMessageCompleted(EventMessageObject item);
  void onLoadGetIncommingMessagesCompleted(List<Messages> items);
  void onLoadGetOutGoingMessagesCompleted(List<MessageOutgoing> items);

  void onLoadMessagesError();
}

class MessagePresenter {
  MessageContract _view;
  SendMessageRepository _sendRepository;
  GetOutgoingMessagesRepository _getOutgoingMessagesRepository;
  GetMessagesRepository _getMessagesRepository;

  MessagePresenter(this._view) {
    _sendRepository = new Injector().senMessageRepsitory;
    _getOutgoingMessagesRepository = new Injector().getOutGoingMessages;
    _getMessagesRepository = new Injector().getMessages;

  }

  void loadSendMessage(String id,String to,String text) {
    _sendRepository
        .sendMessage(id, to, text)
        .then((c) => _view.onLoadSendingMessageCompleted(c))
        .catchError((onError) => _view.onLoadMessagesError());
  }

  void loadGetIncommingMessage(String id) {
    _getMessagesRepository
        .getMessages(id)
        .then((c) => _view.onLoadGetIncommingMessagesCompleted(c))
        .catchError((onError) => _view.onLoadMessagesError());
  }

  void loadGetOutGoingMessage(String id) {
    _getOutgoingMessagesRepository
        .getMessages(id)
        .then((c) => _view.onLoadGetOutGoingMessagesCompleted(c))
        .catchError((onError) => _view.onLoadMessagesError());
  }
}
