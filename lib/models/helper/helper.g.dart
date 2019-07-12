// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'helper.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HelperModel _$HelperModelFromJson(Map<String, dynamic> json) {
  return HelperModel(
      title: json['title'] as String,
      content: json['content'] as String,
      type: json['type'] as String,
      sendDate: json['modifiedtime'] == null
          ? null
          : HelperModel._dateTimefromMilliseconds(json['modifiedtime'] as int),
      mediaModel: json['mediaModel'] == null
          ? null
          : MediaModel.fromJson(json['mediaModel'] as Map<String, dynamic>),
      medias: (json['medias'] as List)
          ?.map((e) =>
              e == null ? null : MediaModel.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      commentCount: json['commentCount'] as int,
      forwardCount: json['forwardCount'] as int,
      isSolve: json['isSolve'] as bool,
      userName: json['userName'] as String,
      userPic: json['userPic'] as String,
      praiseCount: json['praiseCount'] as int)
    ..id = json['id'] as int;
}

Map<String, dynamic> _$HelperModelToJson(HelperModel instance) =>
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
      'isSolve': instance.isSolve,
      'modifiedtime': instance.sendDate?.toIso8601String(),
      'mediaModel': instance.mediaModel == null
          ? null
          : HelperModel._principalToJson(instance.mediaModel),
      'medias': instance.medias == null
          ? null
          : HelperModel._mediasToJson(instance.medias)
    };
