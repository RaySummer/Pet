import 'package:flutter/material.dart';
import 'package:pet/bloc/bloc_provider.dart';
import 'package:pet/bloc/circle/circle_bloc.dart';
import 'package:pet/circle/circle_detail_for_images.dart';
import 'package:pet/models/circle/circle.dart';

class CircleDetailPage extends StatefulWidget {
  CircleModel model;

  CircleDetailPage({this.model});

  @override
  _CircleDetailPageState createState() => _CircleDetailPageState();
}

class _CircleDetailPageState extends State<CircleDetailPage> {

  final GlobalKey _globalKey = GlobalKey<_CircleDetailPageState>();

  @override
  Widget build(BuildContext context) {
    return BLoCProvider<CircleBloC>(
        key: _globalKey,
        bloc: CircleBloC.instance,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              '详情',
              style: TextStyle(
                color: Colors.black54
              ),
            ),
            automaticallyImplyLeading: true,
            actionsIconTheme: IconThemeData(
              color: Colors.black54,
            ),
            elevation: 0.5,
          ),
          body: RefreshIndicator(
              onRefresh: () async {
                // if (!bloc.lock)
                await CircleBloC().refreshDetail('1');
              },
              child: Container(
                child: ListView(
                  children: <Widget>[
                    _buildItemAuthor(context,widget.model),
                    CircleDetailForImagesPage(),
                  ],
                ),
              )),
        )
    );;
  }

  Widget _buildItemAuthor(BuildContext context, CircleModel model) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          Container(
            width: 40,
            height: 40,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                '${model.userPic}',
              ),
              radius: 40,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                '${model.userName}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          Container(
            width: 65,
            height: 35,
//            margin: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
            child: FlatButton(
                onPressed: null,
                child: Text(
                  '关注',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                )),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 1,
                  color: Color(0xffB4EEB4),
                ),
                borderRadius: BorderRadius.circular(10)),
          ),
        ],
      ),
    );
  }

}