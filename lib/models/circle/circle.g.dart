// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'circle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CircleModel _$CircleModelFromJson(Map<String, dynamic> json) {
  return CircleModel(
      title: json['title'] as String,
      content: json['content'] as String,
      type: json['type'] as String,
      sendDate: json['modifiedtime'] == null
          ? null
          : CircleModel._dateTimefromMilliseconds(json['modifiedtime'] as int),
      mediaModel: json['mediaModel'] == null
          ? null
          : MediaModel.fromJson(json['mediaModel'] as Map<String, dynamic>),
      medias: (json['medias'] as List)
          ?.map((e) =>
              e == null ? null : MediaModel.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      commentCount: json['commentCount'] as int,
      forwardCount: json['forwardCount'] as int,
      userName: json['userName'] as String,
      userPic: json['userPic'] as String,
      praiseCount: json['praiseCount'] as int,
      essayType: _$enumDecodeNullable(_$EssayTypeEnumMap, json['essayType']),
      htmlUrl: json['htmlUrl'] as String)
    ..id = json['id'] as int;
}

Map<String, dynamic> _$CircleModelToJson(CircleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'userPic': instance.userPic,
      'title': instance.title,
      'content': instance.content,
      'type': instance.type,
      'commentCount': instance.commentCount,
      'forwardCount': instance.forwardCount,
      'praiseCount': instance.praiseCount,
      'htmlUrl': instance.htmlUrl,
      'essayType': _$EssayTypeEnumMap[instance.essayType],
      'modifiedtime': instance.sendDate?.toIso8601String(),
      'mediaModel': instance.mediaModel == null
          ? null
          : CircleModel._principalToJson(instance.mediaModel),
      'medias': instance.medias == null
          ? null
          : CircleModel._mediasToJson(instance.medias)
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

const _$EssayTypeEnumMap = <EssayType, dynamic>{
  EssayType.CHARACTERS: 'CHARACTERS',
  EssayType.SLIDE_PICTURE: 'SLIDE_PICTURE',
  EssayType.NINE_CELL: 'NINE_CELL',
  EssayType.LONG_ESSAY: 'LONG_ESSAY'
};
