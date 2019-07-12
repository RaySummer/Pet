import 'dart:async';

import 'package:pet/models/message/message.dart';

import '../bloc_base.dart';


class MessageBloC extends BLoCBase {
  // 工厂模式
  factory MessageBloC() => _getInstance();

  static MessageBloC get instance => _getInstance();
  static MessageBloC _instance;

  bool lock = false;

  static final Map<String, List<MessageModel>> _dataMap = {
    'CHAR' : List<MessageModel>(),
    'NOTIFY': List<MessageModel>(),
    'SYSTEM': List<MessageModel>(),
  };

  var _controller = StreamController <ListData>.broadcast();

  MessageBloC._internal() {}

  static MessageBloC _getInstance() {
    if (_instance == null) {
      _instance = MessageBloC._internal();
    }
    return _instance;
  }

  Stream<ListData> get stream => _controller.stream;

  getData(String status) async {
    if(status == 'CHAR'){
      _dataMap['CHAR'].addAll(await Future.delayed(const Duration(seconds: 1), () {
        return <MessageModel>[
          MessageModel.fromJson({
            'title':'小夏夏',
            'content':'哈哈哈哈哈哈！！！！！！！',
            'sendDate': DateTime.now(),
          }),
          MessageModel.fromJson({
            'title':'小吉吉',
            'content':'喵喵喵！！！！！！！',
            'sendDate': DateTime.now(),
          }),
        ];
      }));
    }
    if(status == 'NOTIFY'){
      _dataMap['NOTIFY'].addAll(await Future.delayed(const Duration(seconds: 1), () {
        return <MessageModel>[
          MessageModel.fromJson({
            'title':'评论消息！',
            'content':'哈哈哈哈哈哈！！！！！！！',
            'sendDate': DateTime.now(),
          }),
          MessageModel.fromJson({
            'title':'点赞消息！',
            'content':'你回答的帮帮被点赞啦！！！！！！！',
            'sendDate': DateTime.now(),
          }),
          MessageModel.fromJson({
            'title':'帮助消息！',
            'content':'你帮帮有好心人回复啦！！！！！！！',
            'sendDate': DateTime.now(),
          }),
        ];
      }));
    }
    if(status == 'SYSTEM'){
      _dataMap['SYSTEM'].addAll(await Future.delayed(const Duration(seconds: 1), () {
        return <MessageModel>[
          MessageModel.fromJson({
            'title':'爱宠物小活动',
            'content':'大家踊跃报名参加啦！！！！！！！',
            'sendDate': DateTime.now(),
          }),
          MessageModel.fromJson({
            'title':'爱心领养',
            'content':'大家踊跃报名参加啦！！！！！！！',
            'sendDate': DateTime.now(),
          }),
        ];
      }));
    }
    _controller.sink.add(
        ListData(status: status, data: _dataMap[status]));
  }

  refreshData(String status) async {
    //重置信息
    _dataMap[status].clear();
    await getData(status);
  }

}

class ListData {
  String status;

  List<MessageModel> data;

  ListData({this.status, this.data});
}