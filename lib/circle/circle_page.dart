import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pet/bloc/bloc_provider.dart';
import 'package:pet/bloc/circle/circle_bloc.dart';
import 'package:pet/circle/circle_detail_for_gallery_images.dart';
import 'package:pet/models/circle/circle.dart';
import 'package:pet/widget/cache_picture.dart';
import 'package:pet/widget/webview_page.dart';

import 'circle_detail_page.dart';

class CirclePage extends StatefulWidget {
  AsyncSnapshot<List<CircleModel>> snapshot;

  CirclePage({this.snapshot});

  @override
  _CirclePageState createState() => _CirclePageState();
}

class _CirclePageState extends State<CirclePage> {
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
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: RefreshIndicator(
          onRefresh: () async {
            // if (!bloc.lock)
            await bloc.refreshHelpData('1');
          },
          child: StaggeredGridView.countBuilder(
            controller: scrollController,
            shrinkWrap: true,
            crossAxisCount: 4,
            itemCount: widget.snapshot.data.length,
            itemBuilder: (BuildContext context, int index) =>
                Container(
                    color: Colors.white,
                    child: _buildItems(context,widget.snapshot.data[index],index)
                ),
            staggeredTileBuilder: (int index) =>
                StaggeredTile.count(2, index.isEven ? 3.8 : 3),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          )),
    );
  }

  Widget _buildItems(BuildContext context, CircleModel model, int index) {
    return GestureDetector(
      onTap: () {
        if (model.essayType == EssayType.LONG_ESSAY) {
          Navigator.push(
            context, MaterialPageRoute(
            builder: (context) => WebViewPage(title: '详情', model: model,)),
          );
        } else {
          Navigator.push(
            context, MaterialPageRoute(
              builder: (context) => CircleDetailPage(model: model,)),
          );
        }
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildItemImage(context,model,index),
            _buildItemTitle(context,model),
            _buildItemAuthor(context,model),
          ],
        ),
      ),
    );
  }

  Widget _buildItemImage(BuildContext context,CircleModel model,int index){
    return Container(
      margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
      height: index.isEven ? 280 : 200 ,
      child: CachePicture(
          width: MediaQuery.of(context).size.width / 2 - 10,
          url: '${model.mediaModel.url}',
          fit: BoxFit.cover,
         ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget _buildItemTitle(BuildContext context,CircleModel model){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
      alignment: Alignment.centerLeft,
      child: Text(
        '${model.title}',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black54,
        ),
      ),
    );
  }


  Widget _buildItemAuthor(BuildContext context, CircleModel model){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      child: Row(
        children: <Widget>[
          CachePicture(
            width: 30,
            height: 30,
            url: '${model.userPic}',
            fit: BoxFit.cover,
            borderRadius: 40,
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
            child: Icon(
              Icons.favorite,
              color: Colors.redAccent,
            ),
          ),
          Container(
            child: Text(
              '${model.praiseCount}',
            ),
          ),
        ],
      ),
    );
  }

}
