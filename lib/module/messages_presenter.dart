import 'package:your_doctor/data/chat/base/event_chat_object.dart';
import 'package:your_doctor/data/chat/message_data.dart';
import 'package:your_doctor/util/dependency_injection.dart';

abstract class MessageContract {
  void onLoadSendingMessageCompleted(EventMessageObject item);

  void onLoadMessagesCompleted(List<Messages> items);

  void onLoadMessagesError();
}

class MessagePresenter {
  MessageContract _view;
  SendingMessageRepository _sendRepository;
  GetMessagesRepository _getMessagesRepository;

  MessagePresenter(this._view) {
    _getMessagesRepository = new Injector().getMessages;
    _sendRepository = new Injector().senMessageRepsitory;
  }

  void loadSendMessage(int id, int otherId,String text, String isImage, String image) {
    _sendRepository
        .sendMessage(id, otherId, text,isImage,isImage)
        .then((c) => _view.onLoadSendingMessageCompleted(c))
        .catchError((onError) => _view.onLoadMessagesError());
  }

  void loadGetMessage(int id,int otherId) {
    _getMessagesRepository
        .getMessages(id,otherId)
        .then((c) => _view.onLoadMessagesCompleted(c))
        .catchError((onError) => _view.onLoadMessagesError());
  }
}
