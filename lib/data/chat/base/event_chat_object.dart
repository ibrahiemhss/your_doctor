import 'package:your_doctor/data/chat/message_data.dart';
import 'package:your_doctor/util/constant.dart';

class EventMessageObject {
  int id;
  int messageResponse;
  Messages object;

  EventMessageObject(
      {this.id: EventMessageConstants.NO_INTERNET_CONNECTION,
      this.messageResponse,
      this.object});
}
