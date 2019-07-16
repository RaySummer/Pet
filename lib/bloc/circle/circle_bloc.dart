import 'dart:async';

import 'package:pet/models/circle/circle.dart';
import 'package:pet/models/helper/helper.dart';

import '../bloc_base.dart';


class CircleBloC extends BLoCBase {
  // 工厂模式
  factory CircleBloC() => _getInstance();

  static CircleBloC get instance => _getInstance();
  static CircleBloC _instance;

  bool lock = false;

  List<CircleModel> _dataMap = new List();

  var _controller = StreamController <List<CircleModel>>.broadcast();

  CircleBloC._internal() {}

  static CircleBloC _getInstance() {
    if (_instance == null) {
      _instance = CircleBloC._internal();
    }
    return _instance;
  }

  Stream<List<CircleModel>> get stream => _controller.stream;

  getData(String keyword) async {
      _dataMap.addAll(await Future.delayed(const Duration(seconds: 1), () {
        return <CircleModel>[
          CircleModel.fromJson({
            'userName':'哇哈哈',
            'userPic':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560921944295&di=e32230ee2f55409fd8f1f22baa37716e&imgtype=0&src=http%3A%2F%2Fs8.sinaimg.cn%2Fbmiddle%2Fb3374092gx6C3cBUW3577%26690',
            'title':'爱宠物小活动',
            'content':'大家踊跃报名参加啦！！！！！！！',
            'sendDate': DateTime.now(),
            'commentCount': 50,
            'forwardCount':55,
            'praiseCount':32,
            'mediaModel':{
                'url':'http://image.biaobaiju.com/uploads/20180803/22/1533307858-MwdJnEkxGy.jpg',
            },
            'medias':[
              {
                'url':'',
              },
              {
                'url':'',
              },
            ],
          }),
          CircleModel.fromJson({
            'userName':'哟嗬嗬',
            'userPic':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560921944295&di=e32230ee2f55409fd8f1f22baa37716e&imgtype=0&src=http%3A%2F%2Fs8.sinaimg.cn%2Fbmiddle%2Fb3374092gx6C3cBUW3577%26690',
            'title':'爱宠物小活动',
            'content':'大家踊跃报名参加啦！！！！！！！',
            'sendDate': DateTime.now(),
            'commentCount': 50,
            'forwardCount':55,
            'praiseCount':32,
            'mediaModel':{
              'url':'http://pic1.win4000.com/wallpaper/2017-12-29/5a46103067a08.jpg',
            },
            'medias':[
              {
                'url':'',
              },
              {
                'url':'',
              },
            ],
          }),
          CircleModel.fromJson({
            'userName':'哇哈哈',
            'userPic':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560921944295&di=e32230ee2f55409fd8f1f22baa37716e&imgtype=0&src=http%3A%2F%2Fs8.sinaimg.cn%2Fbmiddle%2Fb3374092gx6C3cBUW3577%26690',
            'title':'爱宠物小活动',
            'content':'大家踊跃报名参加啦！！！！！！！',
            'sendDate': DateTime.now(),
            'commentCount': 50,
            'forwardCount':55,
            'praiseCount':32,
            'mediaModel':{
              'url':'http://image.biaobaiju.com/uploads/20180803/22/1533307858-MwdJnEkxGy.jpg',
            },
            'medias':[
              {
                'url':'',
              },
              {
                'url':'',
              },
            ],
          }),
          CircleModel.fromJson({
            'userName':'哟嗬嗬',
            'userPic':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560921944295&di=e32230ee2f55409fd8f1f22baa37716e&imgtype=0&src=http%3A%2F%2Fs8.sinaimg.cn%2Fbmiddle%2Fb3374092gx6C3cBUW3577%26690',
            'title':'爱宠物小活动',
            'content':'大家踊跃报名参加啦！！！！！！！',
            'sendDate': DateTime.now(),
            'commentCount': 50,
            'forwardCount':55,
            'praiseCount':32,
            'mediaModel':{
              'url':'http://pic1.win4000.com/wallpaper/2017-12-29/5a46103067a08.jpg',
            },
            'medias':[
              {
                'url':'',
              },
              {
                'url':'',
              },
            ],
          }),
          CircleModel.fromJson({
            'userName':'哇哈哈',
            'userPic':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560921944295&di=e32230ee2f55409fd8f1f22baa37716e&imgtype=0&src=http%3A%2F%2Fs8.sinaimg.cn%2Fbmiddle%2Fb3374092gx6C3cBUW3577%26690',
            'title':'爱宠物小活动',
            'content':'大家踊跃报名参加啦！！！！！！！',
            'sendDate': DateTime.now(),
            'commentCount': 50,
            'forwardCount':55,
            'praiseCount':32,
            'mediaModel':{
              'url':'http://image.biaobaiju.com/uploads/20180803/22/1533307858-MwdJnEkxGy.jpg',
            },
            'medias':[
              {
                'url':'',
              },
              {
                'url':'',
              },
            ],
          }),
          CircleModel.fromJson({
            'userName':'哟嗬嗬',
            'userPic':'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560921944295&di=e32230ee2f55409fd8f1f22baa37716e&imgtype=0&src=http%3A%2F%2Fs8.sinaimg.cn%2Fbmiddle%2Fb3374092gx6C3cBUW3577%26690',
            'title':'爱宠物小活动',
            'content':'大家踊跃报名参加啦！！！！！！！',
            'sendDate': DateTime.now(),
            'commentCount': 50,
            'forwardCount':55,
            'praiseCount':32,
            'mediaModel':{
              'url':'http://pic1.win4000.com/wallpaper/2017-12-29/5a46103067a08.jpg',
            },
            'medias':[
              {
                'url':'',
              },
              {
                'url':'',
              },
            ],
          }),
        ];
      }));
    _controller.sink.add(_dataMap);
  }

  getDataService(String keyword) async {
    _dataMap.addAll(await Future.delayed(const Duration(seconds: 1), () {
      return <CircleModel>[
        CircleModel.fromJson({
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
        CircleModel.fromJson({
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
        }),
      ];
    }));
    _controller.sink.add(_dataMap);
  }

  refreshHelpData(String status) async {
    //重置信息
    _dataMap.clear();
    await getData(status);
  }

  refreshDetail(String code) async {

  }


  refreshData(String status) async {
    //重置信息
    _dataMap.clear();
    await getDataService(status);
  }

}
