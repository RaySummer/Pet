import 'dart:async';

import 'package:pet/models/helper/helper.dart';
import 'package:pet/models/message/message.dart';

import '../bloc_base.dart';


class HelperBloC extends BLoCBase {
  // 工厂模式
  factory HelperBloC() => _getInstance();

  static HelperBloC get instance => _getInstance();
  static HelperBloC _instance;

  bool lock = false;

  static final Map<String, List<HelperModel>> _dataMap = {
    'HELP' : List<HelperModel>(),
    'SERVICE': List<HelperModel>(),
  };

  var _controller = StreamController <ListData>.broadcast();

  HelperBloC._internal() {}

  static HelperBloC _getInstance() {
    if (_instance == null) {
      _instance = HelperBloC._internal();
    }
    return _instance;
  }

  Stream<ListData> get stream => _controller.stream;

  getDataHelp(String keyword) async {
      _dataMap['HELP'].addAll(await Future.delayed(const Duration(seconds: 1), () {
        return <HelperModel>[
          HelperModel.fromJson({
            'userName':'哇哈哈',
            'userPic':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560921944295&di=e32230ee2f55409fd8f1f22baa37716e&imgtype=0&src=http%3A%2F%2Fs8.sinaimg.cn%2Fbmiddle%2Fb3374092gx6C3cBUW3577%26690',
            'title':'爱宠物小活动',
            'content':'大家踊跃报名参加啦！！！！！！！',
            'sendDate': DateTime.now(),
            'commentCount': 50,
            'forwardCount':55,
            'praiseCount':32,
            'mediaModel':{
                'url':'',
            },
            'medias':[
              {
                'url':'',
              },
              {
                'url':'',
              },
            ],
            'isSolve':false
          }),
          HelperModel.fromJson({
            'userName':'哟嗬嗬',
            'userPic':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560921944295&di=e32230ee2f55409fd8f1f22baa37716e&imgtype=0&src=http%3A%2F%2Fs8.sinaimg.cn%2Fbmiddle%2Fb3374092gx6C3cBUW3577%26690',
            'title':'爱宠物小活动',
            'content':'大家踊跃报名参加啦！！！！！！！',
            'sendDate': DateTime.now(),
            'commentCount': 50,
            'forwardCount':55,
            'praiseCount':32,
            'mediaModel':{
              'url':'',
            },
            'medias':[
              {
                'url':'',
              },
              {
                'url':'',
              },
            ],
            'isSolve':true
          }),
        ];
      }));
    _controller.sink.add(
        ListData(status: 'HELP', data: _dataMap['HELP']));
  }

  getDataService(String keyword) async {
    _dataMap['HELP'].addAll(await Future.delayed(const Duration(seconds: 1), () {
      return <HelperModel>[
        HelperModel.fromJson({
          'userName':'哇哈哈',
          'userPic':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560921944295&di=e32230ee2f55409fd8f1f22baa37716e&imgtype=0&src=http%3A%2F%2Fs8.sinaimg.cn%2Fbmiddle%2Fb3374092gx6C3cBUW3577%26690',
          'title':'爱宠物小活动',
          'content':'大家踊跃报名参加啦！！！！！！！',
          'sendDate': DateTime.now(),
          'commentCount': 50,
          'forwardCount':55,
          'praiseCount':32,
          'mediaModel':{
            'url':'',
          },
          'medias':[
            {
              'url':'',
            },
            {
              'url':'',
            },
          ],
          'isSolve':false
        }),
        HelperModel.fromJson({
          'userName':'哟嗬嗬',
          'userPic':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560921944295&di=e32230ee2f55409fd8f1f22baa37716e&imgtype=0&src=http%3A%2F%2Fs8.sinaimg.cn%2Fbmiddle%2Fb3374092gx6C3cBUW3577%26690',
          'title':'爱宠物小活动',
          'content':'大家踊跃报名参加啦！！！！！！！',
          'sendDate': DateTime.now(),
          'commentCount': 50,
          'forwardCount':55,
          'praiseCount':32,
          'mediaModel':{
            'url':'',
          },
          'medias':[
            {
              'url':'',
            },
            {
              'url':'',
            },
          ],
          'isSolve':false
        }),
      ];
    }));
    _controller.sink.add(
        ListData(status: 'SERVICE', data: _dataMap['SERVICE']));
  }

  refreshHelpData(String status) async {
    //重置信息
    _dataMap[status].clear();
    await getDataHelp(status);
  }

  refreshServiceData(String status) async {
    //重置信息
    _dataMap[status].clear();
    await getDataService(status);
  }

}

class ListData {
  String status;

  List<HelperModel> data;

  ListData({this.status, this.data});
}