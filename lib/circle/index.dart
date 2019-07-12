import 'package:flutter/material.dart';
import 'package:pet/bloc/bloc_provider.dart';
import 'package:pet/bloc/circle/circle_bloc.dart';
import 'package:pet/bloc/helper/helper_bloc.dart';
import 'package:pet/bloc/system/progress_indicator.dart';
import 'package:pet/helper/helper_list_page.dart';
import 'package:pet/models/circle/circle.dart';
import 'package:pet/unit/help_types.dart';

import 'circle_page.dart';

class CircleIndexPage extends StatefulWidget{
  @override
  _CircleIndexPageState createState() => _CircleIndexPageState();
}

class _CircleIndexPageState extends State<CircleIndexPage>{
  final GlobalKey _globalKey = GlobalKey<_CircleIndexPageState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BLoCProvider<CircleBloC>(
      key: _globalKey,
      bloc: CircleBloC.instance,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
                '宠物圈子',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
              ),
            ),
          ),
          elevation: 0.5,
//          centerTitle: true,
          automaticallyImplyLeading: false,
          actions: <Widget>[
            Container(
              child: Icon(
                Icons.search,
                color: Colors.black54,
                size: 30,
              ),
            ),
            Container(
              width: 65,
              margin: EdgeInsets.symmetric(vertical: 12,horizontal: 15),
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
        body: CircleListPage(),
      ),
    );
  }

  Widget _buildSearch() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      child: Container(
        height: 30,
        padding:EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[300], width: 0.5),
        ),
        child: Container(
          margin: EdgeInsets.only(bottom: 5),
          padding: EdgeInsets.fromLTRB(2, 5, 0, 0),
          child: Row(
            children: <Widget>[
              Container(
                child: Icon(
                  Icons.search,
                  size: 20,
                  color: Colors.black54,
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    '搜你想看的。。',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

class CircleListPage extends StatefulWidget{
  @override
  _CircleListPageState createState() => _CircleListPageState();
}

class _CircleListPageState extends State<CircleListPage>{
  //帮助类型
  List<CircleType> typeList = CircleTypes().getTypeList();

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    var bloc = BLoCProvider.of<CircleBloC>(context);

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        bloc.getData('11');
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    var bloc = BLoCProvider.of<CircleBloC>(context);
    return Container(
      decoration: BoxDecoration(color: Colors.grey[100]),
      child:  RefreshIndicator(
        onRefresh: () async {
          // if (!bloc.lock)
          await bloc.refreshHelpData('1');
        },
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: scrollController,
          children: <Widget>[
            _buildCircleTypeForListView(),
            StreamBuilder<List<CircleModel>>(
              stream: bloc.stream,
              // initialData: null,
              builder: (BuildContext context,
                  AsyncSnapshot<List<CircleModel>> snapshot) {
                if (snapshot.data == null) {
                  bloc.getData('');
                  return ProgressIndicatorFactory.buildPaddedProgressIndicator();
                }
                if (snapshot.hasData) {
                  return CirclePage(snapshot: snapshot,);
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

  Widget _buildCircleTypeForListView(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 13,),
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap:true,
        children: List.generate(typeList.length, (index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 12,vertical: 10),
            child: Column(
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  child: CircleAvatar(
                      backgroundImage: AssetImage(
                        '${typeList[index].url}',
                      ),
                    radius: 40,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 5.0,
                          spreadRadius: 0.0),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Text(
                    '${typeList[index].type}',
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

}