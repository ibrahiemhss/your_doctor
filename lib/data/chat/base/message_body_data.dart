
class MessageBody {
  final String sender_name;
  final int sender_id;
  final String isImage;
  final String msg_content;
  final String created_at;
  final int message_status;


  MessageBody(
      {
        this.sender_name,
        this.sender_id,
        this.msg_content,
        this.isImage,
        this.created_at,this.message_status}) {}

  factory MessageBody.fromJson(Map<String, dynamic> json) {
    return new MessageBody(
      sender_name: json['sender_name'] as String,
      sender_id: json['sender_id'] as int,
      msg_content: json['msg_content'] as String,
      isImage: json['is_image'] as String,
      created_at: json['created_at'] as String,
      message_status: json['message_status'] as int,

    );
  }

  MessageBody.fromMap(Map<String, dynamic> map)
      :
        sender_name = map['sender_name'],
        sender_id = map['sender_id'],
        msg_content = map['msg_content'],
        isImage = map['is_image'],
        created_at = map['created_at'],
        message_status = map['message_status'];

/// Class constructor

/// Class constructor

}