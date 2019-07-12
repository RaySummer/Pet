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
      praiseCount: json['praiseCount'] as int)
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
      'modifiedtime': instance.sendDate?.toIso8601String(),
      'mediaModel': instance.mediaModel == null
          ? null
          : CircleModel._principalToJson(instance.mediaModel),
      'medias': instance.medias == null
          ? null
          : CircleModel._mediasToJson(instance.medias)
    };
