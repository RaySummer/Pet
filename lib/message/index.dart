import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:pet/bloc/bloc_base.dart';
import 'package:pet/bloc/bloc_provider.dart';
import 'package:pet/bloc/system/app_bloc.dart';
import 'package:pet/bloc/system/progress_indicator.dart';
import 'package:pet/models/message/message.dart';
import 'package:pet/models/models.dart';
import 'package:pet/unit/date_util.dart';
import 'package:pet/widget/tabbar_factory.dart';

class MessageIndexPage extends StatefulWidget{
  @override
  _MessageIndexPageState createState() => _MessageIndexPageState();
}

const mesType = <EnumModel>[
  EnumModel('CHAR', '聊天'),
  EnumModel('NOTIFY', '通知'),
  EnumModel('SYSTEM', '消息'),
];

class _MessageIndexPageState extends State<MessageIndexPage> with SingleTickerProviderStateMixin,AutomaticKeepAliveClientMixin{

  final GlobalKey _globalKey = GlobalKey<_MessageIndexPageState>();

  var controller;

@override
  void initState() {
  controller = TabController(
    length: mesType.length,
    vsync: this, //动画效果的异步处理，默认格式
  );
//  ..addListener(() {
//    if(controller.index.toDouble() == controller.animation.value){
//      switch (controller.index) {
//        case 2:
//          print(3);
//          break;
//      }
//    }
//  });

    super.initState();
  }
  //当整个页面dispose时，记得把控制器也dispose掉，释放内存
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BLoCProvider<MessageBloC>(
      key: _globalKey,
      bloc: MessageBloC.instance,
      child: Scaffold(
        backgroundColor: Colors.white30,
        appBar: AppBar(
          backgroundColor: Colors.white30,
          title: TabBarFactory(controller: controller, enumList: mesType,),
          elevation: 0.0,
        ),
        body: Container(
          child: TabBarView(
            controller: controller,
            children: mesType.map(
                  (type) => MessageList(mesType: type,),
            ).toList(),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

}


class MessageList extends StatefulWidget{
  EnumModel mesType;
  MessageList({this.mesType});

  final ScrollController scrollController = ScrollController();

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> with AutomaticKeepAliveClientMixin{

  @override
  void initState() {
    super.initState();

    var bloc = BLoCProvider.of<MessageBloC>(context);

    widget.scrollController.addListener(() {
      if (widget.scrollController.position.pixels ==
          widget.scrollController.position.maxScrollExtent) {
        bloc.getData(widget.mesType.code);
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    var bloc = BLoCProvider.of<MessageBloC>(context);
    return Container(
      decoration: BoxDecoration(color: Colors.grey[100]),
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: RefreshIndicator(
        onRefresh: () async {
          // if (!bloc.lock)
          await bloc.refreshData(widget.mesType.code);
        },
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: widget.scrollController,
          children: <Widget>[
            StreamBuilder<ListData>(
              stream: bloc.stream.where((messageList) =>
              messageList.status == widget.mesType.code),
              // initialData: null,
              builder: (BuildContext context,
                  AsyncSnapshot<ListData> snapshot) {
                if (snapshot.data == null) {
                  bloc.getData(widget.mesType.code);
                  return ProgressIndicatorFactory.buildPaddedProgressIndicator();
                }
                if (snapshot.data.data.length <= 0) {
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 200),
                        child: Image.asset(
                          'temp/logo2.png',
                          package: 'assets',
                          width: 80,
                          height: 80,
                        ),
                      ),
                      Container(
                          child: Text(
                            AppBLoC.instance.getConnectivityResult ==
                                ConnectivityResult.none
                                ? '网络链接不可用请重试'
                                : '没有相关消息数据',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          )),
                    ],
                  );
                }
                if (snapshot.hasData) {
                  return Column(
                    children: snapshot.data.data.map((model) {
                      return MessageListItem(
                        model: model,
                      );
                    }).toList(),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
              },
            ),
            StreamBuilder<bool>(
              stream: bloc.loadingStream,
              initialData: false,
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                return ProgressIndicatorFactory
                    .buildPaddedOpacityProgressIndicator(
                  opacity: snapshot.data ? 1.0 : 0,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

}

class MessageListItem extends StatefulWidget {
  MessageModel model;

  MessageListItem({this.model});

  @override
  _MessageListItemState createState() => _MessageListItemState();
}
class _MessageListItemState extends State<MessageListItem> with AutomaticKeepAliveClientMixin{

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: null,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: _buildCharItem(),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }

  Widget _buildCharItem() {
    return Container(
      child: Row(
        children: <Widget>[
          _buildUnread(),
//          Container(
//            height: 60,
//            width: 60,
//            child: Container(
//              child: Image.network(
//                backgroundColor: Colors.white,
//                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1560921944295&di=e32230ee2f55409fd8f1f22baa37716e&imgtype=0&src=http%3A%2F%2Fs8.sinaimg.cn%2Fbmiddle%2Fb3374092gx6C3cBUW3577%26690',
//                fit: BoxFit.scaleDown,
//              ),
//              decoration: BoxDecoration(
//                border: Border.all(color: Colors.black12, width: 0.5),
//                color: Colors.white,
//                shape: BoxShape.rectangle,
//                borderRadius: BorderRadius.circular((8.0)),
//              ),
//            ),
//          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 15),
                  child: Text(
                    '${widget.model.title}',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Text(
                    '${widget.model.content}',
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              DateFormatUtil.formatYMD(DateTime.now()),
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
          )
        ],
      ),
    );
  }


  Widget _buildRedDot(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.red,
      ),
    );
  }

  //未读消息时显示的头像
  Widget _buildUnread(){
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          width: 60,
          height: 60,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage('http://b-ssl.duitang.com/uploads/item/201808/21/20180821215317_kepjr.jpeg'),
            radius: 100.0,
          ),
        ),
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;

}
