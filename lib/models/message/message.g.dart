// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) {
  return MessageModel(
      title: json['title'] as String,
      content: json['content'] as String,
      messageType:
          _$enumDecodeNullable(_$MessageTypeEnumMap, json['messageType']),
      sendDate: json['modifiedtime'] == null
          ? null
          : MessageModel._dateTimefromMilliseconds(json['modifiedtime'] as int),
      mediaModel: json['mediaModel'] == null
          ? null
          : MediaModel.fromJson(json['mediaModel'] as Map<String, dynamic>))
    ..id = json['id'] as int
    ..medias = (json['medias'] as List)
        ?.map((e) =>
            e == null ? null : MediaModel.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'messageType': _$MessageTypeEnumMap[instance.messageType],
      'modifiedtime': instance.sendDate?.toIso8601String(),
      'mediaModel': instance.mediaModel == null
          ? null
          : MessageModel._principalToJson(instance.mediaModel),
      'medias': instance.medias == null
          ? null
          : MessageModel._mediasToJson(instance.medias)
    };

T _$enumDecode<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }
  return enumValues.entries
      .singleWhere((e) => e.value == source,
          orElse: () => throw ArgumentError(
              '`$source` is not one of the supported values: '
              '${enumValues.values.join(', ')}'))
      .key;
}

T _$enumDecodeNullable<T>(Map<T, dynamic> enumValues, dynamic source) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source);
}

const _$MessageTypeEnumMap = <MessageType, dynamic>{
  MessageType.MSG_COMMENT: 'MSG_COMMENT',
  MessageType.MSG_PRAISE: 'MSG_PRAISE',
  MessageType.MSG_HELP: 'MSG_HELP',
  MessageType.MSG_SYSTEM: 'MSG_SYSTEM',
  MessageType.MSG_CHAR: 'MSG_CHAR'
};
