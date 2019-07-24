library models;

import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

abstract class ItemModel {
  int id;
}


/// 枚举
@JsonSerializable()
class EnumModel {
  final dynamic code;
  final String name;

  const EnumModel(this.code, this.name);

  factory EnumModel.fromJson(Map<String, dynamic> json) =>
      _$EnumModelFromJson(json);

  static Map<String, dynamic> toJson(EnumModel model) =>
      _$EnumModelToJson(model);
}

///根据code获取name
String enumMap(dynamic enumModels,String code){
  String text = '';
  EnumModel model = enumModels.firstWhere((enumModel) => enumModel.code == code,orElse: () => null);
  if(model != null){
    text = model.name;
  }
  return text;
}

List<EnumModel> enumCodesToModels(List<String> codes,dynamic enumModels){
  return codes.map((code){
    return enumModels.firstWhere((enumModel) => enumModel.code == code,orElse: () => null);;
  }).toList();
}
List<String> enumCodesToNames(List<String> codes,dynamic enumModels){
  List<String> names = codes.map((code){
    EnumModel model = enumModels.firstWhere((enumModel) => enumModel.code == code,orElse: () => null);
    if(model != null){
      return model.name;
    }else{
      return null;
    }
  }).toList();
//
//  if(codes.length > count){
//    names = names.sublist(0,count);
//  }

  return names;
}

//格式选中的枚举（多选）
String formatEnumSelectsText(List<String> codes, List<EnumModel> enumModels,int count) {
  String text = '';

  if (codes != null) {
    text = '';
    for (int i = 0; i < codes.length; i++) {
      if (i > count-1) {
        text += '...';
        break;
      }

      if (i == codes.length - 1) {
        text += enumMap(enumModels, codes[i]);
      } else {
        text += enumMap(enumModels, codes[i]) + '、';
      }
    }
  }

  return text;
}

//格式选中的枚举（单选）
String formatEnumSelectText(
    List<EnumModel> enumModels, List<String> enumCode) {
  String text = '';
  if (enumCode.isNotEmpty)
    text = enumMap(enumModels, enumCode[0]);
  return text;
}

@JsonSerializable()
class MediaModel extends ItemModel{
  /// 文件名
  String name;

  /// URL地址
  String url;

  /// 文件类型
  String mediaType;

  MediaModel({this.name,this.url,this.mediaType});

  factory MediaModel.fromJson(Map<String, dynamic> json) =>
      _$MediaModelFromJson(json);

  static Map<String, dynamic> toJson(MediaModel model) =>
      _$MediaModelToJson(model);

}

