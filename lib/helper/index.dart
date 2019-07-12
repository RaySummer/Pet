import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet/bloc/bloc_provider.dart';
import 'package:pet/bloc/helper/helper_bloc.dart';
import 'package:pet/bloc/system/progress_indicator.dart';
import 'package:pet/helper/helper_list_page.dart';
import 'package:pet/helper/service_list_page.dart';
import 'package:pet/models/models.dart';
import 'package:pet/widget/tabbar_factory.dart';


const mesType = <EnumModel>[
  EnumModel('HELP', '帮帮'),
  EnumModel('SERVICE', '附近服务'),
];

class HelperIndexPage extends StatefulWidget {
  @override
  _HelperIndexPageState createState() => _HelperIndexPageState();
}

class _HelperIndexPageState extends State<HelperIndexPage> with SingleTickerProviderStateMixin,AutomaticKeepAliveClientMixin{
  final GlobalKey _globalKey = GlobalKey<_HelperIndexPageState>();

  var controller;

  @override
  void initState() {
    controller = TabController(
      length: mesType.length,
      vsync: this, //动画效果的异步处理，默认格式
    );

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
    return BLoCProvider<HelperBloC>(
      key: _globalKey,
      bloc: HelperBloC.instance,
      child: Scaffold(
        backgroundColor: Colors.white30,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: <Widget>[
              Expanded(
                child: TabBarFactory(controller: controller, enumList: mesType,),
              ),
              Container(
                width: 65,
                margin: EdgeInsets.symmetric(vertical: 12,),
                child: FlatButton(
                    onPressed: null,
                    child: Text(
                      '发布',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    )
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                    border: Border.all(
                      width: 1,
                      color: Color(0xffB4EEB4),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(1.0, 1.0),
                          blurRadius: 1.0,
                          spreadRadius: 0.0),
                    ],
                    borderRadius: BorderRadius.circular(10)
                ),
              ),
            ],
          ),
          elevation: 0.5,
        ),
        body: Container(
          child: TabBarView(
//            physics: NeverScrollableScrollPhysics(),
            controller: controller,
            children: mesType.map(
                  (type) => HelperList(type: type,),
            ).toList(),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class HelperList extends StatefulWidget{
  EnumModel type;
  HelperList({this.type});

  final ScrollController scrollController = ScrollController();

  @override
  _HelperListState createState() => _HelperListState();
}

class _HelperListState extends State<HelperList> with AutomaticKeepAliveClientMixin{

  @override
  void initState() {
    super.initState();

    var bloc = BLoCProvider.of<HelperBloC>(context);

    widget.scrollController.addListener(() {
      if (widget.scrollController.position.pixels ==
          widget.scrollController.position.maxScrollExtent) {
        bloc.getDataHelp('HELP');
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    if (widget.type.code == 'HELP') {
      return _buildHelperPage();
    } else if (widget.type.code == 'SERVICE') {
      return _buildNearbyServicePage();
    }
    else {
      return Container(
        child: Center(
          child: Text(
              '出错了'
          ),
        ),
      );
    }
  }


  Widget _buildHelperPage(){
    var bloc = BLoCProvider.of<HelperBloC>(context);
    return Container(
      decoration: BoxDecoration(color: Colors.grey[100]),
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child:  RefreshIndicator(
        onRefresh: () async {
          // if (!bloc.lock)
          await bloc.refreshHelpData(widget.type.code);
        },
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: widget.scrollController,
          children: <Widget>[
            StreamBuilder<ListData>(
              stream: bloc.stream.where((messageList) =>
              messageList.status == widget.type.code),
              // initialData: null,
              builder: (BuildContext context,
                  AsyncSnapshot<ListData> snapshot) {
                if (snapshot.data == null) {
                  bloc.getDataHelp(widget.type.code);
                  return ProgressIndicatorFactory.buildPaddedProgressIndicator();
                }
                if (snapshot.hasData) {
                  return HelperPage(snapshot: snapshot,);
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

  Widget _buildNearbyServicePage(){
    var bloc = BLoCProvider.of<HelperBloC>(context);
    return Container(
      decoration: BoxDecoration(color: Colors.grey[100]),
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child:  RefreshIndicator(
        onRefresh: () async {
          // if (!bloc.lock)
          await bloc.refreshServiceData(widget.type.code);
        },
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: widget.scrollController,
          children: <Widget>[
            StreamBuilder<ListData>(
              stream: bloc.stream.where((messageList) =>
              messageList.status == widget.type.code),
              // initialData: null,
              builder: (BuildContext context,
                  AsyncSnapshot<ListData> snapshot) {
                if (snapshot.data == null) {
                  bloc.getDataService(widget.type.code);
                  return ProgressIndicatorFactory.buildPaddedProgressIndicator();
                }
                if (snapshot.hasData) {
                  return ServicePage(snapshot: snapshot,);
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

