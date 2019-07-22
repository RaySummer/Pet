import 'package:flutter/material.dart';
import 'package:pet/bloc/bloc_provider.dart';
import 'package:pet/bloc/circle/circle_bloc.dart';
import 'package:pet/circle/circle_context_page.dart';
import 'package:pet/circle/circle_detail_for_gallery_images.dart';
import 'package:pet/circle/circle_detail_for_nine_cell_image.dart';
import 'package:pet/models/circle/circle.dart';
import 'package:pet/widget/cache_picture.dart';
import 'package:pet/widget/webview_page.dart';

class CircleDetailPage extends StatefulWidget {
  CircleModel model;

  CircleDetailPage({this.model});

  @override
  _CircleDetailPageState createState() => _CircleDetailPageState();
}

class _CircleDetailPageState extends State<CircleDetailPage> {
  var _futureBuilderFuture;
  final GlobalKey _globalKey = GlobalKey<_CircleDetailPageState>();

  @override
  void initState() {
    super.initState();
    _futureBuilderFuture = _getData();
  }

  Future<CircleModel> _getData() async {
    // 对接后台查询详情
    CircleModel detail = widget.model;

    return detail;
  }

  @override
  Widget build(BuildContext context) {
    return BLoCProvider<CircleBloC>(
        key: _globalKey,
        bloc: CircleBloC.instance,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: Colors.black54,
            ),
            backgroundColor: Colors.white,
            title: Text(
              '详情',
              style: TextStyle(
                color: Colors.black54
              ),
            ),
            automaticallyImplyLeading: true,
            elevation: 0.5,
          ),
          body:  FutureBuilder<CircleModel>(
            builder: (BuildContext context,
                AsyncSnapshot<CircleModel> snapshot) {
              if (snapshot.data != null) {
                return Container(
                    child: ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        _buildItemAuthor(context,snapshot.data),
                        _buildContent(context,snapshot.data),
                      ],
                    )
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }, initialData: null,
            future: _futureBuilderFuture,
          ),
        )
    );;
  }

  Widget _buildContent(BuildContext context, CircleModel model) {
    if(model.essayType == EssayType.CHARACTERS){
      return CircleContextPage();
    }else if(model.essayType == EssayType.SLIDE_PICTURE){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleContextPage(),
          CircleDetailForGalleryImagesPage(),
        ],
      );
    }else if(model.essayType == EssayType.NINE_CELL) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CircleContextPage(),
          CircleDetailForNineCellImages(),
        ],
      );
    }
//    }else if(model.essayType == EssayType.LONG_ESSAY){
//      return Column(
//        children: <Widget>[
//          WebViewPage(),
//        ],
//      );
//    }

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
            child: CachePicture(
              url: '${model.userPic}',
              width: 40,
              height: 40,
              borderRadius: 40,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
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