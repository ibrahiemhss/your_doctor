// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_data.dart';

// **************************************************************************
// Generator: JsonSerializableGenerator
// **************************************************************************

Messages _$UserFromJson(Map<String, dynamic> json) => new Messages(
    id: json['id'] as String,
    text: json['text'] as String);

abstract class _$UserSerializerMixin {
  String get id;

  String get text;



  
  Map<String, dynamic> toJson() => <String, dynamic>{
       'id': id,
       'name': text};
}
