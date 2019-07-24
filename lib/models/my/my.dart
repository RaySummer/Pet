import 'package:json_annotation/json_annotation.dart';
import 'package:pet/models/models.dart';

part 'my.g.dart';

@JsonSerializable()
class PetMomentModel extends ItemModel{
  ///小标题
  String title;
  ///正文
  String context;
  ///短视频
  @JsonKey(toJson: _mediaToJson)
  MediaModel video;
  ///照片
  @JsonKey(toJson: _mediasToJson)
  List<MediaModel> pictures;
  ///发布时间
  @JsonKey(name: "modifiedtime", fromJson: _dateTimefromMilliseconds)
  DateTime createTime;
  ///是否公开（默认公开）
  bool isPublic;

  PetMomentModel({
    this.title,
    this.context,
    this.createTime,
    this.isPublic,
    this.pictures,
    this.video,
  });

  factory PetMomentModel.fromJson(Map<String, dynamic> json) =>
      _$PetMomentModelFromJson(json);

  static Map<String, dynamic> toJson(PetMomentModel model) =>
      _$PetMomentModelToJson(model);

  static DateTime _dateTimefromMilliseconds(int date) =>
      DateTime.fromMillisecondsSinceEpoch(date);

  static Map<String, dynamic> _mediaToJson(MediaModel model) =>
      MediaModel.toJson(model);

  static List<Map<String, dynamic>> _mediasToJson(List<MediaModel> models) =>
      models.map((model) => MediaModel.toJson(model)).toList();

}