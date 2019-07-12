// GENERATED CODE - DO NOT MODIFY BY HAND

part of models;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EnumModel _$EnumModelFromJson(Map<String, dynamic> json) {
  return EnumModel(json['code'], json['name'] as String);
}

Map<String, dynamic> _$EnumModelToJson(EnumModel instance) =>
    <String, dynamic>{'code': instance.code, 'name': instance.name};

MediaModel _$MediaModelFromJson(Map<String, dynamic> json) {
  return MediaModel(
      name: json['name'] as String,
      url: json['url'] as String,
      mediaType: json['mediaType'] as String)
    ..id = json['id'] as int;
}

Map<String, dynamic> _$MediaModelToJson(MediaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'mediaType': instance.mediaType
    };
