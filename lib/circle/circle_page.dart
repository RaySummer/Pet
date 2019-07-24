import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pet/bloc/bloc_provider.dart';
import 'package:pet/bloc/circle/circle_bloc.dart';
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
                  child: _buildItems(
                      context, widget.snapshot.data[index], index),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
            staggeredTileBuilder: (int index) =>
                StaggeredTile.count(2, index.isEven ? 3.8 : 3.2),
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
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
          children: <Widget>[
            Expanded(child: _buildItemImage(context,model,index),flex: 5,),
            Expanded(child: _buildItemTitle(context,model),flex: 1,),
            _buildItemAuthor(context,model),
          ],
        ),
      ),
    );
  }

  Widget _buildItemImage(BuildContext context,CircleModel model,int index){
    return Container(
      height: index.isEven ? 250  : 200,
      child: CachePicture(
          width: MediaQuery.of(context).size.width / 2 - 10,
          height: index.isEven ? 250  : 200,
          url: '${model.mediaModel.url}',
          fit: BoxFit.cover,
        borderRadius: 10,
         ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget _buildItemTitle(BuildContext context,CircleModel model){
    return Container(
      height: 35,
      margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
      alignment: Alignment.centerLeft,
      child: Text(
        '${model.title}',
        overflow: TextOverflow.ellipsis,
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
                overflow: TextOverflow.ellipsis,
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
