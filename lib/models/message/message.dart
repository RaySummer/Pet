
import 'package:json_annotation/json_annotation.dart';
import 'package:pet/models/models.dart';

part 'message.g.dart';


@JsonSerializable()
class MessageModel extends ItemModel{
  String title;
  String content;

  MessageType messageType;

  @JsonKey(name: "modifiedtime", fromJson: _dateTimefromMilliseconds)
  DateTime sendDate;

  @JsonKey(toJson: _principalToJson)
  MediaModel mediaModel;

  @JsonKey(toJson: _mediasToJson)
  List<MediaModel> medias;

  MessageModel({
    this.title,
    this.content,
    this.messageType,
    this.sendDate,
    this.mediaModel,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  static Map<String, dynamic> toJson(MessageModel model) =>
      _$MessageModelToJson(model);

  static DateTime _dateTimefromMilliseconds(int date) =>
      DateTime.fromMillisecondsSinceEpoch(date);

  static Map<String, dynamic> _principalToJson(MediaModel model) =>
      MediaModel.toJson(model);

  static List<Map<String, dynamic>> _mediasToJson(List<MediaModel> models) =>
      models.map((model) => MediaModel.toJson(model)).toList();

}


enum MessageType{
  //评论消息
  MSG_COMMENT,

  //点赞消息
  MSG_PRAISE,

  //帮帮消息
  MSG_HELP,

  //系统通知
  MSG_SYSTEM,

  //聊天通知
  MSG_CHAR

}

// TODO: i18n处理
const MessageTypeLocalizedMap = {
  MessageType.MSG_COMMENT: "评论消息",
  MessageType.MSG_PRAISE: "点赞消息",
  MessageType.MSG_HELP: "帮帮消息",
  MessageType.MSG_SYSTEM: "系统通知",
  MessageType.MSG_CHAR : "聊天通知",
};

const MessageTypeMap = {
  MessageType.MSG_COMMENT: "MSG_COMMENT",
  MessageType.MSG_PRAISE: "MSG_PRAISE",
  MessageType.MSG_HELP: "MSG_HELP",
  MessageType.MSG_SYSTEM: "MSG_SYSTEM",
  MessageType.MSG_CHAR : "MSG_CHAR",
};
