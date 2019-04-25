// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_data.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Messages _$UserFromJson(Map<String, dynamic> json) =>
    new Messages(
        id: json['id'] as int,
        user_id: json['user_id'] as int,
        otherId: json['other_id'] as int,
        text: json['content'] as String,
        isImage: json['is_image'] as String,
        imageUrl: json['image'] as String);

abstract class _$UserSerializerMixin {
  int get id;
  int get user_id;
  int get otherId;
  String get text;
  bool get isImage;
  String get imageUrl;



}
