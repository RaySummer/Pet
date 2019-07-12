import 'package:json_annotation/json_annotation.dart';
import 'package:pet/models/models.dart';

part 'circle.g.dart';

@JsonSerializable()
class CircleModel extends ItemModel {
  //用户名
  String userName;

  //头像
  String userPic;

  //标题
  String title;

  //正文内容
  String content;

  //类型
  String type;

  //评论人数
  int commentCount;

  //转发人数
  int forwardCount;

  //点赞人数
  int praiseCount;

  //发布日期
  @JsonKey(name: "modifiedtime", fromJson: _dateTimefromMilliseconds)
  DateTime sendDate;

  //图片
  @JsonKey(toJson: _principalToJson)
  MediaModel mediaModel;

  //图片组
  @JsonKey(toJson: _mediasToJson)
  List<MediaModel> medias;

  CircleModel({
    this.title,
    this.content,
    this.type,
    this.sendDate,
    this.mediaModel,
    this.medias,
    this.commentCount,
    this.forwardCount,
    this.userName,
    this.userPic,
    this.praiseCount,
  });

  factory CircleModel.fromJson(Map<String, dynamic> json) =>
      _$CircleModelFromJson(json);

  static Map<String, dynamic> toJson(CircleModel model) =>
      _$CircleModelToJson(model);

  static DateTime _dateTimefromMilliseconds(int date) =>
      DateTime.fromMillisecondsSinceEpoch(date);

  static Map<String, dynamic> _principalToJson(MediaModel model) =>
      MediaModel.toJson(model);

  static List<Map<String, dynamic>> _mediasToJson(List<MediaModel> models) =>
      models.map((model) => MediaModel.toJson(model)).toList();
}
