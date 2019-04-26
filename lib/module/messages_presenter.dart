import 'package:your_doctor/data/chat/base/event_chat_object.dart';
import 'package:your_doctor/data/chat/message_data.dart';
import 'package:your_doctor/util/dependency_injection.dart';

abstract class MessageContract {
  void onLoadSendingMessageCompleted(EventMessageObject item,String text,String sendId, String recieveId,  String image,String isImage);

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
 // [String text, int id, String imageUrl, String isImg, String name) {

  void loadSendMessage(String text,String sendId, String recieveId,  String image,String isImage) {

    print("test sending IDs 2.=.=.=.=.=..=.=.==.=.=..=.=.=.=..= sender id ism $sendId And reciever Id is $recieveId");

    _sendRepository
        .sendMessage(text, sendId, recieveId,image,isImage)
        .then((c) => _view.onLoadSendingMessageCompleted(c,text, sendId, recieveId,image,isImage))
        .catchError((onError) => _view.onLoadMessagesError());
  }

  void loadGetMessage(String id,String otherId) {
    _getMessagesRepository
        .getMessages(id,otherId)
        .then((c) => _view.onLoadMessagesCompleted(c))
        .catchError((onError) => _view.onLoadMessagesError());
  }
}
