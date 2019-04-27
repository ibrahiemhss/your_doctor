import 'package:your_doctor/data/chat/base/event_chat_object.dart';
import 'package:your_doctor/data/chat/message_data.dart';
import 'package:your_doctor/util/dependency_injection.dart';

abstract class MessageContract {
  void onLoadSendingMessageCompleted(EventMessageObject item,
      String msg_content,String msg_from, String msg_to,String isImage,String msg_created_at);

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

  void loadSendMessage(String msg_from, String msg_to,
  String sender_name, String reciver_name,String msg_content,String msg_pic_file,  String isImage,String msg_created_at) {

    print("test msg_from IDs 2.=.=.=.=.=..=.=.==.=.=..=.=.=.=..= msg_from id ism $msg_from And msg_to Id is $msg_to");

    _sendRepository
        .sendMessage( msg_from,  msg_to,
        sender_name,reciver_name, msg_content, msg_pic_file,   isImage, msg_created_at)
        .then((c) => _view.onLoadSendingMessageCompleted(c,msg_content, msg_from, msg_to,isImage,msg_created_at))
        .catchError((onError) => _view.onLoadMessagesError());
  }

  void loadGetMessage(String msg_from, String msg_to) {
    _getMessagesRepository
        .getMessages(msg_from,msg_to)
        .then((c) => _view.onLoadMessagesCompleted(c))
        .catchError((onError) => _view.onLoadMessagesError());
  }
}
